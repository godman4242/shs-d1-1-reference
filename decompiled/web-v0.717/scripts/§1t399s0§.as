package
{
   import flash.display.MovieClip;
   
   public class §1t399s0§ extends StageObject
   {
      
      internal var objectName:String;
      
      internal var props:String;
      
      internal var shown:Boolean = false;
      
      internal var §1t8501s0§:Boolean = true;
      
      internal var §1t8502s0§:§1t107s0§;
      
      internal var §1t8503s0§:int = -1;
      
      internal var blocking:Boolean = false;
      
      internal var blockingRange:int = 50;
      
      public function §1t399s0§()
      {
         super();
         if(Boolean(this.§1t8512s0§()) && !this.§1t8525s0§())
         {
            buttonMode = true;
         }
      }
      
      override public function §1t8161s0§() : Boolean
      {
         return this.§1t8501s0§;
      }
      
      public function needTransition() : Boolean
      {
         return false;
      }
      
      public function setQuestAction(param1:§1t107s0§) : *
      {
         this.§1t8502s0§ = param1;
      }
      
      public function hasQuestAction() : Boolean
      {
         return this.§1t8502s0§ != null;
      }
      
      public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !this.shown && this.§1t8501s0§)
         {
            if(this.§1t8502s0§ != null)
            {
               §1t406s0§.instance.§1t6574s0§().§1t6390s0§(this,this.§1t8502s0§.title,this.§1t8502s0§.§1t1105s0§,this.§1t8502s0§.type,this.§1t8502s0§.id,this.§1t8502s0§.§1t1103s0§,this.§1t8502s0§.ap);
            }
            else
            {
               §1t406s0§.instance.§1t6574s0§().§1t6388s0§(this,this.§1t8503s0§);
            }
            this.shown = true;
         }
         else if(!param1 && this.shown)
         {
            this.shown = false;
         }
      }
      
      public function interact() : *
      {
      }
      
      public function interact2() : *
      {
      }
      
      public function §1t8512s0§() : *
      {
         return true;
      }
      
      public function §1t8513s0§() : MovieClip
      {
         return this;
      }
      
      public function §1t8514s0§() : String
      {
         return this.objectName;
      }
      
      public function §1t8515s0§(param1:Boolean) : *
      {
         this.shown = param1;
      }
      
      public function §1t8516s0§(param1:Boolean) : *
      {
         this.§1t8501s0§ = param1;
      }
      
      public function §1t6733s0§() : String
      {
         if(this.objectName == "")
         {
            return §1t1521s0§.getString(145);
         }
         return §1t1521s0§.getString(144) + this.objectName;
      }
      
      public function §1t8517s0§() : int
      {
         return 0;
      }
      
      internal function abs(param1:Number) : Number
      {
         return param1 < 0 ? -param1 : param1;
      }
      
      public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return this.§1t8501s0§ && this.abs(x - param1.x) < 50;
      }
      
      public function §1t8519s0§(param1:Boolean) : *
      {
      }
      
      public function §1t8520s0§(param1:Boolean) : *
      {
      }
      
      public function §1t8521s0§() : Boolean
      {
         return this.blocking;
      }
      
      public function §1t8522s0§() : Boolean
      {
         return this.blocking;
      }
      
      public function §1t8523s0§() : *
      {
         this.interact();
      }
      
      public function §1t5853s0§() : *
      {
      }
      
      public function §1t8524s0§(param1:int, param2:int) : Boolean
      {
         return this.§1t8513s0§().hitTestPoint(param1,param2,true);
      }
      
      public function §1t8525s0§() : Boolean
      {
         return false;
      }
      
      public function §1t8526s0§() : int
      {
         return this.blockingRange;
      }
   }
}

