package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3430")]
   public class §1t6497s0§ extends MovieClip
   {
      
      internal static var §1t12480s0§:int = 0;
      
      internal static var §1t12481s0§:int = 1;
      
      internal static var §1t12482s0§:int = 2;
      
      internal static var §1t12483s0§:int = 3;
      
      internal static var §1t9995s0§:int = 0;
      
      internal static var §1t12484s0§:int = 1;
      
      internal static var §1t12442s0§:int = 2;
      
      internal static var §1t12485s0§:int = 3;
      
      internal static var §1t12434s0§:int = 4;
      
      internal static var §1t12486s0§:int = 5;
      
      internal static var §1t12487s0§:int = 6;
      
      internal static var §1t12488s0§:int = 7;
      
      internal static var §1t12489s0§:int = 8;
      
      internal static var §1t12490s0§:int = 9;
      
      public var blackdown:MovieClip;
      
      public var blackup:MovieClip;
      
      public var white:MovieClip;
      
      internal var action:int = 0;
      
      internal var param:Object;
      
      internal var §1t6842s0§:Boolean = false;
      
      internal var §1t6843s0§:Number;
      
      internal var §1t6844s0§:int;
      
      internal var counter:int;
      
      internal var §1t5149s0§:Boolean = false;
      
      internal var §1t6845s0§:int;
      
      internal var §1t6846s0§:int;
      
      internal var §1t6847s0§:int = 150;
      
      internal var §1t6854s0§:Boolean = false;
      
      public function §1t6497s0§()
      {
         super();
         this.blackup.visible = false;
         this.blackdown.visible = false;
         this.white.visible = false;
      }
      
      public function update() : *
      {
         if(!this.§1t6842s0§)
         {
            return;
         }
         ++this.counter;
         if(this.§1t6844s0§ == §1t12480s0§)
         {
            this.blackup.y += this.§1t6843s0§;
            this.blackdown.y -= this.§1t6843s0§;
            this.§1t6843s0§ += 2;
            if(this.blackup.y >= 0)
            {
               this.blackup.y = 0;
               this.blackdown.y = 240;
               if(this.counter >= 17)
               {
                  this.§1t3270s0§();
               }
            }
         }
         else if(this.§1t6844s0§ == §1t12481s0§)
         {
            this.blackup.y -= this.§1t6843s0§;
            this.blackdown.y += this.§1t6843s0§;
            this.§1t6843s0§ += 2;
            if(this.blackup.y <= -240)
            {
               this.blackup.y = -240;
               this.blackdown.y = 480;
               this.blackup.visible = false;
               this.blackdown.visible = false;
               this.blackup.cacheAsBitmap = false;
               this.blackdown.cacheAsBitmap = false;
               this.§1t3270s0§();
            }
         }
         else if(this.§1t6844s0§ == §1t12482s0§)
         {
            this.white.alpha -= 1 / 24;
            if(this.white.alpha <= 0)
            {
               this.white.visible = false;
               this.white.cacheAsBitmap = false;
               this.§1t6842s0§ = false;
            }
            if(this.counter == 2)
            {
               this.§1t3270s0§();
            }
         }
      }
      
      public function §1t6848s0§(param1:int) : *
      {
         if(this.§1t6842s0§ && param1 == 3)
         {
            return;
         }
         this.action = param1;
         this.§1t6842s0§ = true;
         if(§1t406s0§.instance != null)
         {
            §1t406s0§.instance.§1t6535s0§();
         }
         this.§1t6844s0§ = §1t12480s0§;
         this.blackup.visible = true;
         this.blackdown.visible = true;
         this.blackup.cacheAsBitmap = true;
         this.blackdown.cacheAsBitmap = true;
         this.white.visible = false;
         this.blackup.y = -240;
         this.blackdown.y = 480;
         this.§1t6843s0§ = 0;
         this.counter = 0;
      }
      
      public function §1t6849s0§(param1:int) : *
      {
         this.action = param1;
         this.§1t6842s0§ = true;
         this.§1t6844s0§ = §1t12481s0§;
         this.blackup.visible = true;
         this.blackdown.visible = true;
         this.blackup.cacheAsBitmap = true;
         this.blackdown.cacheAsBitmap = true;
         this.white.visible = false;
         this.blackup.y = 0;
         this.blackdown.y = 240;
         this.§1t6843s0§ = 0;
         this.counter = 0;
      }
      
      public function §1t6850s0§(param1:int) : *
      {
         this.action = param1;
         this.§1t6842s0§ = true;
         this.§1t6844s0§ = §1t12482s0§;
         this.blackup.visible = false;
         this.blackdown.visible = false;
         this.white.visible = true;
         this.white.alpha = 1;
         this.counter = 0;
         if(!this.white.cacheAsBitmap)
         {
            this.white.cacheAsBitmapMatrix = this.white.transform.concatenatedMatrix;
            this.white.cacheAsBitmap = true;
         }
      }
      
      public function §1t6851s0§(param1:Object) : *
      {
         this.param = param1;
      }
      
      public function §1t6852s0§(param1:int, param2:int = 0, param3:int = 150) : *
      {
         this.§1t6845s0§ = param1;
         this.§1t6846s0§ = param2;
         if(this.§1t6846s0§ == -1)
         {
            this.§1t6846s0§ = 0;
         }
         this.§1t6847s0§ = param3;
      }
      
      public function §1t6853s0§() : Boolean
      {
         return this.§1t6842s0§;
      }
      
      public function §1t6855s0§() : Boolean
      {
         return this.§1t6854s0§;
      }
      
      public function §1t1130s0§() : *
      {
         §1t1540s0§.§1t10036s0§();
         this.§1t6854s0§ = false;
         this.§1t3270s0§();
      }
      
      public function §1t3270s0§() : *
      {
         var _loc1_:§1t399s0§ = null;
         var _loc2_:int = 0;
         this.§1t6842s0§ = false;
         switch(this.action)
         {
            case §1t9995s0§:
               break;
            case §1t12489s0§:
               this.§1t6849s0§(§1t9995s0§);
               break;
            case §1t12484s0§:
               §1t6427s0§.§1t12479s0§();
               this.§1t6849s0§(§1t9995s0§);
               break;
            case §1t12442s0§:
               _loc1_ = this.param as §1t399s0§;
               _loc1_.interact();
               _loc2_ = §1t1525s0§.§1t9923s0§();
               if(!§1t3317s0§.instance.§1t1833s0§ && (_loc2_ == §1t134s0§.§1t9232s0§ || _loc2_ == §1t134s0§.§1t9233s0§ || _loc2_ == §1t134s0§.§1t9234s0§ || _loc2_ == §1t134s0§.§1t9236s0§ || _loc2_ == §1t134s0§.§1t9237s0§))
               {
                  this.§1t5149s0§ = true;
                  §1t1540s0§.§1t10035s0§(§1t1040s0§.§1t12376s0§);
               }
               else
               {
                  this.§1t6849s0§(§1t9995s0§);
               }
               break;
            case §1t12486s0§:
               if(!this.§1t6854s0§ && §1t1525s0§.§1t9920s0§(this.§1t6845s0§))
               {
                  this.§1t6854s0§ = true;
                  §1t1540s0§.§1t10035s0§();
                  this.§1t6842s0§ = true;
                  this.§1t6844s0§ = §1t12483s0§;
                  return;
               }
               if(this.§1t6845s0§ != -1)
               {
                  §1t1525s0§.§1t9922s0§(this.§1t6846s0§,this.§1t6847s0§,this.§1t6845s0§);
               }
               this.§1t6845s0§ = -1;
               this.§1t6847s0§ = 150;
               this.§1t6846s0§ = 0;
               this.§1t6849s0§(§1t9995s0§);
               break;
            case §1t12487s0§:
               if(this.§1t6845s0§ != -1)
               {
                  §1t1525s0§.§1t9922s0§(this.§1t6846s0§,this.§1t6847s0§,this.§1t6845s0§);
               }
               this.§1t6845s0§ = -1;
               this.§1t6847s0§ = 150;
               this.§1t6846s0§ = 0;
               this.§1t6849s0§(§1t9995s0§);
               §1t1523s0§.§1t9586s0§().§1t3269s0§(§1t1544s0§.§1t11152s0§);
               §1t1523s0§.§1t9586s0§().§1t1559s0§().§1t6286s0§(false);
               break;
            case §1t12488s0§:
               if(!this.§1t6854s0§ && §1t1525s0§.§1t9920s0§(this.§1t6845s0§))
               {
                  this.§1t6854s0§ = true;
                  §1t1540s0§.§1t10035s0§();
                  this.§1t6842s0§ = true;
                  this.§1t6844s0§ = §1t12483s0§;
                  return;
               }
               if(this.§1t6845s0§ != -1)
               {
                  §1t1525s0§.§1t9922s0§(this.§1t6846s0§,this.§1t6847s0§,this.§1t6845s0§);
               }
               this.§1t6845s0§ = -1;
               this.§1t6847s0§ = 150;
               this.§1t6846s0§ = 0;
               this.§1t6849s0§(§1t9995s0§);
               §1t1523s0§.§1t9763s0§(§1t1523s0§.§1t9714s0§(30021));
               §1t3317s0§.instance.§1t1946s0§();
               break;
            case §1t12485s0§:
               §1t1525s0§.§1t9933s0§();
               this.§1t6849s0§(§1t9995s0§);
               break;
            case §1t12490s0§:
               §1t1525s0§.§1t9933s0§();
               this.§1t6842s0§ = true;
               break;
            case §1t12434s0§:
               §1t1523s0§.§1t9579s0§();
               §1t1523s0§.§1t9578s0§();
               §1t3317s0§.instance.§1t1946s0§();
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(205),§1t1521s0§.getString(5));
               this.§1t6849s0§(§1t9995s0§);
               §1t88s0§.instance.§1t1513s0§();
         }
      }
      
      public function §1t5150s0§() : Boolean
      {
         if(this.§1t5149s0§)
         {
            this.§1t5149s0§ = false;
            §1t1540s0§.§1t10036s0§();
            this.§1t6849s0§(§1t9995s0§);
            §1t1525s0§.§1t9908s0§.§1t5150s0§();
            return true;
         }
         return false;
      }
   }
}

