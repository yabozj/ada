
with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;


package body interrupt is
   task body TM_Task is
      count: Integer:=1;
   begin
      accept Start;
      Put_Line("TM_Task Start!");
      loop
         select
            accept Go;
         or
            delay 5.0;
            Put_Line("No Telemetry Int");
         end select;
         Put("TM_Task Main processing !");
         Put(count);
         New_Line;
         count:=count+1;
      end loop;
   end TM_Task;

   protected  body InterruptProcess is
      procedure TeleInt is
         tm: TM_Task;
         pragma Import (Ada, tm, "tm");  --global variable
      begin
         tm.go;
      end TeleInt;
   end InterruptProcess;

end interrupt;
