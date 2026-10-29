package playerio
{
   import flash.events.Event;
   
   public class §1t149s0§ extends Event
   {
      
      public static const ON_MESSAGE:String = "onMessage";
      
      public var message:§1t84s0§;
      
      public function §1t149s0§(param1:String, param2:§1t84s0§)
      {
         this.message = param2;
         super(param1);
      }
      
      override public function clone() : Event
      {
         return new §1t149s0§(type,message);
      }
   }
}

