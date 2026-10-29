package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1758")]
   public class §1t249s0§ extends MovieClip
   {
      
      public var bar:MovieClip;
      
      public var nametext:TextField;
      
      internal var max:int = -1;
      
      internal var counter:int = 0;
      
      internal var §1t6301s0§:int;
      
      public function §1t249s0§()
      {
         super();
      }
      
      public function §1t6302s0§(param1:int, param2:int) : *
      {
         this.counter = 0;
         this.max = param1;
         this.§1t6301s0§ = param2;
         switch(param2)
         {
            case §1t407s0§.§1t12436s0§:
               this.nametext.text = §1t1521s0§.getString(209);
               break;
            case §1t407s0§.§1t12460s0§:
               this.nametext.text = §1t1521s0§.getString(649);
         }
         this.visible = true;
      }
      
      public function cancel() : *
      {
         this.counter = this.max + 1;
         this.visible = false;
      }
      
      public function §1t6304s0§() : Boolean
      {
         return this.counter < this.max;
      }
      
      public function §1t775s0§() : *
      {
         return this.§1t6301s0§;
      }
      
      public function update() : *
      {
         if(this.counter < this.max)
         {
            ++this.counter;
            this.bar.scaleX = this.counter / this.max;
            if(this.counter == this.max)
            {
               this.visible = false;
               switch(this.§1t6301s0§)
               {
                  case §1t407s0§.§1t12436s0§:
                     §1t406s0§.instance.§1t6574s0§().§1t6396s0§();
                     break;
                  case §1t407s0§.§1t12460s0§:
                     §1t406s0§.instance.§1t6574s0§().§1t6400s0§();
               }
            }
         }
      }
   }
}

