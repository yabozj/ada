
with Ada.Interrupts.Names;
use Ada.Interrupts.Names;
package interrupt is
   task type TM_Task is
      entry Start;
      entry Go;
   end TM_Task;


   protected  InterruptProcess is
      procedure TeleInt;
      pragma Attach_Handler(TeleInt,SIGUSR1);   -- attach isr
   end InterruptProcess;

end interrupt;
