package
{
   public class Modifier
   {
      
      public var modifierID:int;
      
      internal var value:int;
      
      public function Modifier(a:int, v:int)
      {
         super();
         this.modifierID = a;
         this.value = v;
      }
      
      public function getModifierID() : int
      {
         return this.modifierID;
      }
      
      public function getModValue() : int
      {
         return this.value;
      }
   }
}

