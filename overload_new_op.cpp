		
#include <iostream>
#include <malloc.h>
using namespace std;

class pool {
		public:
			void *GetMem( unsigned int num_bytes )
			{
				return malloc( num_bytes );
			}
		};

		class base {
		 public:
		   void *operator new( unsigned int num_bytes, pool *mem)
			{
				return mem->GetMem( num_bytes);
			}
		};

		main()
		{
			base *pB1;
			base *pB2;
			pool mem;

			pB1 = new( &mem ) base_one( one );
			pB2 = new( &mem ) base_two( two );
		}
