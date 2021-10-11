record myManager {
     var x: int = 0;

     proc enterThis() ref: int {
       writeln('x is: ', x);
       return x;
     }

     proc leaveThis(in err: owned Error?) {
       if err then halt(err:string);
       writeln('x is: ', x);
     }
   }

   //var m = new myManager();
   manage new myManager() as myResource {
     // Prints '0'
     myResource = 8;
     // Prints '8'
   }