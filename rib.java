
protectiondomain QueueDomain {}

protectiondomain MasterDomain(
		ProtectionDomain owner, QueueDomain q) {
	grant {read,write,inject} to {owner};
	require {read} from {owner};
	require {read,write,inject} from {q};
}

protectiondomain WorkerDomain(
		MasterDomain m, QueueDomain q) {
	require {read,write} from {q};
	grant {read} to {m};
}

ribbon Worker(WorkerDomain wdom) {
	static class WorkerThread extends Thread
	{ public void run() { ... } }
}

ribbon Master(MasterDomain mdom) {
	QueueDomain qdom = new QueueDomain();
	Queue q = new<qdom> Queue();
	public void createWorker() {
		Worker w = new Worker()
			where (new WorkerDomain(
						getdomain(thisribbon, mdom), qdom));
		w.run(new Worker.WorkerThread());
	}
	class MasterThread extends java.lang.Thread {
		public void produce()
		{ q.add(new<qdom> WorkItem(...)); }
		public void run() {
			for (int i=0; i<5; i++){ createWorker(); }
			...
		}
	}
}
