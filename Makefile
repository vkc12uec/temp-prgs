
all:
	g++ amz_sp_insert_inText.cpp -o amz_sp_insert_inText

run:
	./amz_sp_insert_inText.cpp

clean:
	rm ./amz_sp_insert_inText.cpp

