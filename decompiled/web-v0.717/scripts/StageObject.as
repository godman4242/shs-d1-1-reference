package
{
   import flash.display.MovieClip;
   
   public class StageObject extends MovieClip
   {
      
      internal var typeid:int;
      
      internal var §1t8160s0§:Boolean = false;
      
      public function StageObject()
      {
         super();
      }
      
      public function §1t8161s0§() : Boolean
      {
         return false;
      }
      
      public function init(param1:int, param2:int, param3:String) : *
      {
      }
      
      public function §1t2289s0§(param1:int) : *
      {
         x += param1;
      }
      
      public function §1t1552s0§(param1:MovieClip) : *
      {
         param1.removeChild(this);
      }
      
      public function §1t8162s0§(param1:§1t107s0§) : *
      {
      }
      
      public function §1t8163s0§() : Boolean
      {
         return this.§1t8160s0§;
      }
      
      public function update() : *
      {
      }
      
      public function §1t8164s0§() : Boolean
      {
         return false;
      }
   }
}

