package
{
   import flash.display.MovieClip;
   
   public class §1t4565s0§ extends §1t68s0§
   {
      
      internal var §1t4566s0§:MovieClip;
      
      internal var §1t4567s0§:Array = new Array();
      
      public function §1t4565s0§(param1:§1t75s0§ = null)
      {
         super();
         if(param1 == null)
         {
            this.mcs = new §1t75s0§();
         }
         else
         {
            this.mcs = param1;
         }
         this.§1t4566s0§ = new §1t5658s0§();
         §1t1521s0§.§1t9290s0§(this.§1t4566s0§.tutmessage.tutmessage);
         this.§1t4566s0§.tutmessage.tutmessage.text = §1t1521s0§.getString(267);
         this.§1t4567s0§.push(this.§1t4566s0§.vege0);
         this.§1t4567s0§.push(this.§1t4566s0§.vege1);
         this.§1t4567s0§.push(this.§1t4566s0§.vege2);
         this.§1t4567s0§.push(this.§1t4566s0§.vege3);
         this.§1t4567s0§.push(this.§1t4566s0§.vege4);
         this.§1t4567s0§.push(this.§1t4566s0§.vege5);
         this.§1t4567s0§.push(this.§1t4566s0§.vege6);
         this.§1t4567s0§.push(this.§1t4566s0§.vege7);
         this.§1t4567s0§.push(this.§1t4566s0§.vege8);
         this.§1t4567s0§.push(this.§1t4566s0§.vege9);
         var _loc2_:int = 0;
         while(_loc2_ < 10)
         {
            this.§1t4567s0§[_loc2_].gotoAndStop(int(Math.random() * 7 + 1));
            this.§1t4567s0§[_loc2_].rotation = Math.random() * 20 - 10;
            _loc2_++;
         }
      }
      
      override public function setPosition(param1:int, param2:int) : *
      {
         this.§1t4566s0§.x = param1 - §1t1525s0§.§1t8131s0§();
         this.§1t4566s0§.y = param2;
         posX = param1;
         mcs.x = param1;
         mcs.y = param2;
      }
      
      override public function §1t1551s0§(param1:MovieClip) : *
      {
         param1.addChild(this.§1t4566s0§);
      }
      
      override public function §1t1552s0§(param1:MovieClip) : *
      {
         param1.removeChild(this.§1t4566s0§);
      }
      
      override public function §1t1553s0§(param1:int) : *
      {
         this.§1t4566s0§.x += param1;
         posX += param1;
      }
      
      override public function §1t2292s0§() : *
      {
         §1t1643s0§.§1t11215s0§(this.§1t4566s0§);
         §1t3260s0§ = true;
         this.§1t4566s0§.tutmessage.visible = false;
      }
      
      override public function §1t3311s0§() : *
      {
         §1t1643s0§.§1t3311s0§(this.§1t4566s0§);
         this.§1t4566s0§.tutmessage.visible = true;
      }
      
      override public function update() : *
      {
         if(§1t3246s0§ > 0)
         {
            --§1t3246s0§;
         }
      }
      
      override public function §1t3273s0§(param1:int, param2:int, param3:§1t67s0§) : Boolean
      {
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         if(!this.§1t4566s0§.hitTestPoint(param1,param2))
         {
            return false;
         }
         if(§1t3309s0§() > 0)
         {
            §1t3308s0§(§1t3309s0§() - 1);
            §1t3246s0§ = 12;
            if(§1t3309s0§() > 0)
            {
               this.§1t4566s0§.§1t5659s0§.bar.width = §1t3309s0§() / §1t3257s0§ * 60;
            }
            else
            {
               this.§1t4566s0§.§1t5659s0§.visible = false;
            }
            this.§1t4568s0§();
            §1t88s0§.instance.§1t1508s0§();
         }
         return true;
      }
      
      override public function §1t3274s0§(param1:MovieClip, param2:§1t67s0§, param3:Boolean = false, param4:Boolean = false) : Boolean
      {
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         if(!this.§1t4566s0§.hitTestObject(param1))
         {
            return false;
         }
         if(§1t3309s0§() > 0)
         {
            §1t3308s0§(§1t3309s0§() - 1);
            §1t3246s0§ = 12;
            if(§1t3309s0§() > 0)
            {
               this.§1t4566s0§.§1t5659s0§.bar.width = §1t3309s0§() / §1t3257s0§ * 60;
            }
            else
            {
               this.§1t4566s0§.§1t5659s0§.visible = false;
            }
            this.§1t4568s0§();
            §1t88s0§.instance.§1t1508s0§();
         }
         §1t3256s0§ = false;
         return true;
      }
      
      internal function §1t4568s0§() : *
      {
         var _loc1_:int = Math.random() * this.§1t4567s0§.length;
         var _loc2_:§1t131s0§ = this.§1t4567s0§[_loc1_];
         this.§1t4567s0§.splice(_loc1_,1);
         var _loc3_:int = _loc2_.x + this.§1t4566s0§.x;
         §1t1712s0§.§1t11330s0§(_loc3_,this.§1t4566s0§.y - 50,Math.random() * 20 - 10,-Math.random() * 10 - 20,-1,_loc2_);
      }
      
      override public function §1t3298s0§() : *
      {
         §1t3258s0§ = true;
         mcs.§1t3305s0§();
         mcs = null;
         §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20040,1);
      }
   }
}

