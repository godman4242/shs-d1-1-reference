package
{
   import flash.display.MovieClip;
   
   public class §1t4558s0§ extends §1t68s0§
   {
      
      internal var line:§1t4560s0§;
      
      public function §1t4558s0§(param1:§1t75s0§ = null)
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
      }
      
      override public function setLevel(param1:int) : *
      {
         level = param1;
         if(param1 == 1)
         {
            §1t6495s0§.instance.§1t1023s0§(1);
         }
         else if(param1 == 2)
         {
            §1t1557s0§(§1t10947s0§);
            §1t6495s0§.instance.§1t1023s0§(5);
            mcs.§1t6288s0§(§1t1521s0§.getString(629));
         }
         else if(param1 == 3)
         {
            §1t1557s0§(§1t11031s0§);
            §1t3257s0§ = 8;
            §1t3308s0§(§1t3257s0§);
            mcs.§1t6288s0§(§1t1521s0§.getString(630));
            §1t113s0§.instance.§1t5226s0§();
         }
         else if(param1 == 4)
         {
            §1t6495s0§.instance.§1t1023s0§(13);
         }
      }
      
      override public function update() : *
      {
         if(mcs == null || §1t3260s0§)
         {
            return;
         }
         var _loc1_:String = mcs.§1t3268s0§();
         if(_loc1_ != "")
         {
            switch(_loc1_)
            {
               case §1t10409s0§:
               case §1t10291s0§:
               case §1t10289s0§:
               case §1t10413s0§:
               case §1t10411s0§:
               case §1t10417s0§:
               case §1t10419s0§:
                  §1t3299s0§();
                  break;
               case §1t10451s0§:
               case §1t10515s0§:
               case §1t10315s0§:
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10405s0§:
                  §1t1557s0§(§1t10407s0§);
                  break;
               case §1t10295s0§:
                  if(§1t3258s0§)
                  {
                     §1t3299s0§();
                  }
                  else
                  {
                     if(§1t3309s0§() > 0)
                     {
                        mcs.§1t6279s0§();
                     }
                     mcs.§1t6281s0§(-100);
                     §1t1557s0§(§1t10297s0§);
                  }
                  break;
               case §1t10297s0§:
                  §1t1557s0§(§1t10299s0§);
                  break;
               case §1t10299s0§:
                  mcs.§1t6281s0§(0);
                  if(mcs.scaleX == 1)
                  {
                     §1t1553s0§(-100);
                  }
                  else
                  {
                     §1t1553s0§(100);
                  }
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10313s0§:
                  if(target.§1t3292s0§())
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage * 2,level));
                  }
                  §1t1557s0§(§1t10315s0§);
            }
         }
         this.§1t3270s0§();
         if(§1t3246s0§ > 0)
         {
            --§1t3246s0§;
         }
      }
      
      override public function §1t3269s0§(param1:int) : *
      {
         this.actionState = param1;
         switch(param1)
         {
            case §1t11141s0§:
            case §1t11143s0§:
               break;
            case §1t11151s0§:
               §1t1557s0§(§1t10515s0§);
               break;
            case §1t11147s0§:
               §1t1557s0§(§1t10403s0§);
               break;
            case §1t11152s0§:
               §1t1557s0§(§1t10295s0§);
               break;
            case §1t11145s0§:
               §1t1557s0§(§1t10449s0§);
               break;
            case §1t11146s0§:
               §1t1557s0§(§1t10451s0§);
               break;
            case §1t11153s0§:
               break;
            case §1t11163s0§:
               §1t1557s0§(§1t10313s0§);
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         switch(actionState)
         {
            case §1t11141s0§:
            case §1t11143s0§:
            case §1t11151s0§:
               break;
            case §1t11147s0§:
               §1t3288s0§();
               break;
            case §1t11152s0§:
               break;
            case §1t11145s0§:
               mcs.y += velY;
               velY += 3;
               if(mcs.y >= §1t1525s0§.§1t4467s0§())
               {
                  mcs.y = §1t1525s0§.§1t4467s0§();
                  this.§1t3269s0§(§1t11146s0§);
               }
               break;
            case §1t11146s0§:
               break;
            case §1t11153s0§:
               §1t3300s0§();
         }
      }
      
      override public function §1t3273s0§(param1:int, param2:int, param3:§1t67s0§) : Boolean
      {
         var _loc5_:MovieClip = null;
         if(level == 2 && param3.stance != 2)
         {
            return false;
         }
         var _loc4_:int = mcs.§1t6260s0§();
         var _loc6_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc7_:* = int(_loc4_ - 1);
         while(_loc7_ >= 0 && !§1t3256s0§)
         {
            _loc5_ = _loc6_[_loc7_];
            if(_loc5_.hitTestPoint(param1,param2))
            {
               if(§1t3277s0§(_loc5_,param3))
               {
                  return true;
               }
               return false;
            }
            _loc7_--;
         }
         return false;
      }
      
      override public function §1t3274s0§(param1:MovieClip, param2:§1t67s0§, param3:Boolean = false, param4:Boolean = false) : Boolean
      {
         var _loc6_:MovieClip = null;
         if(level == 2 && param2.stance != 2)
         {
            return false;
         }
         var _loc5_:int = mcs.§1t6260s0§();
         var _loc7_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc8_:* = int(_loc5_ - 1);
         while(_loc8_ >= 0 && !§1t3256s0§)
         {
            _loc6_ = _loc7_[_loc8_];
            if(_loc6_.hitTestObject(param1))
            {
               if(§1t3277s0§(_loc6_,param2))
               {
                  if(§1t3279s0§())
                  {
                     §1t1543s0§.§1t10236s0§();
                  }
                  return true;
               }
               return false;
            }
            _loc8_--;
         }
         §1t3256s0§ = false;
         return false;
      }
      
      override public function §1t2292s0§() : *
      {
         mcs.§1t6280s0§();
         if(mcs.alpha < 1)
         {
            mcs.visible = false;
         }
         else
         {
            §1t1643s0§.§1t11216s0§(mcs,-255);
         }
         if(actionState != §1t11147s0§ && actionState != §1t11153s0§)
         {
            §1t3260s0§ = true;
         }
         mcs.§1t6288s0§("");
         §1t6495s0§.instance.§1t1023s0§(0);
         if(this.line != null)
         {
            mcs.removeChild(this.line);
         }
      }
      
      override public function §1t3298s0§() : *
      {
         if(level == 1)
         {
            super.§1t3298s0§();
         }
         else
         {
            §1t88s0§.instance.§1t1507s0§();
            §1t3294s0§();
            §1t3295s0§();
            actionState = §1t11153s0§;
            if(level == 3)
            {
               §1t1557s0§(§1t10419s0§);
            }
            else
            {
               §1t1557s0§(§1t10411s0§);
            }
            §1t3258s0§ = true;
            mcs.§1t6280s0§();
         }
      }
   }
}

