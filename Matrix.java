public class Matrix {

	public static void flood(boolean[][] matrix) {
		for (int row = 0; row < matrix.length; row++) {
			for (int col = 0; col < matrix[0].length; col++) {
				if (matrix[row][col]) {
					matrix[0][col] = true;
					matrix[row][0] = true;
				}
			}
		}
		for (int row = 0; row < matrix.length; row++) {
			for (int col = 0; col < matrix[0].length; col++) {
				matrix[row][col] = matrix[0][col] || matrix[row][0];
			}
		}
	}

	public static void printMatrix(boolean[][] matrix) {
		for (int row = 0; row < matrix.length; row++) {
			for (int column = 0; column < matrix[0].length; column++) {
				System.out.print(matrix[row][column] ? "1 " : "0 ");
			}
			System.out.println();
		}
	}

	public static void main(String[] argc) {
		boolean[][] matrix = new boolean[40][50];

		// populate random booleans
		Random random = new Random();

		for (int i = 0; i < 40; i++) {
			for (int j = 0; j < 50; j++) {
				matrix[i][j] = false;
			}
		}
		for (int i = 0; i < 5; i++) {
			matrix[Math.abs(random.nextInt()) % 40][Math.abs(random.nextInt()) % 50] = true;
		}

		printMatrix(matrix);
		flood(matrix);
		printMatrix(matrix);

	}
}
