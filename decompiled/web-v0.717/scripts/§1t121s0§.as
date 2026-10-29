package
{
   import flash.display.MovieClip;
   
   public class §1t121s0§ extends §1t68s0§
   {
      
      internal var §1t4408s0§:int;
      
      internal var §1t4513s0§:§1t379s0§;
      
      internal var §1t4514s0§:int;
      
      internal var §1t4515s0§:String = "";
      
      internal var §1t4516s0§:int = 0;
      
      public function §1t121s0§(param1:§1t75s0§ = null)
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
         §1t3250s0§ = true;
      }
      
      override public function init(param1:§1t76s0§) : *
      {
         §1t1550s0§(param1.mcs);
         reset();
         this.§1t3269s0§(§1t11141s0§);
         mcs.§1t6280s0§();
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
               case §1t10307s0§:
                  this.§1t3269s0§(§1t11152s0§);
                  break;
               case §1t10896s0§:
                  §1t1557s0§(§1t10309s0§);
                  break;
               case §1t10309s0§:
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     §1t1553s0§(-40);
                  }
                  else
                  {
                     §1t1553s0§(40);
                  }
                  this.§1t3269s0§(§1t11141s0§);
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
                     if(actionState == §1t11172s0§)
                     {
                        §1t1557s0§(§1t10299s0§);
                     }
                     else
                     {
                        §1t1557s0§(§1t10297s0§);
                     }
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
               §1t1557s0§(§1t10267s0§);
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10269s0§);
               if(this.§1t4408s0§ < posX)
               {
                  mcs.§1t5492s0§();
               }
               else
               {
                  mcs.§1t5493s0§();
               }
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         switch(actionState)
         {
            case §1t11141s0§:
               break;
            case §1t11143s0§:
               §1t1553s0§(§1t3243s0§);
               if(Math.abs(this.§1t4408s0§ - posX) < 10)
               {
                  this.§1t3269s0§(§1t11141s0§);
                  if(this.§1t4515s0§ != "")
                  {
                     if(this.§1t4516s0§ == -1)
                     {
                        §1t1557s0§(this.§1t4515s0§);
                        this.§1t4515s0§ = "";
                        this.§1t4516s0§ = 0;
                     }
                     else
                     {
                        §1t1559s0§().§1t6246s0§(this.§1t4515s0§,this.§1t4516s0§);
                        this.§1t4515s0§ = "";
                        this.§1t4516s0§ = 0;
                     }
                  }
               }
               break;
            case §1t11193s0§:
               §1t1553s0§(velX);
               mcs.y += velY;
         }
      }
      
      public function §1t4511s0§(param1:String, param2:String) : *
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         switch(param1)
         {
            case "anim":
               §1t1557s0§(param2);
               break;
            case "stopmoving":
               this.§1t4408s0§ = posX;
               break;
            case "1t15242s0":
               _loc3_ = param2.split(",");
               §1t1559s0§().§1t6246s0§(_loc3_[0],_loc3_[1]);
               break;
            case "face":
               if(param2 == "right")
               {
                  §1t1559s0§().§1t5493s0§();
               }
               else
               {
                  §1t1559s0§().§1t5492s0§();
               }
               break;
            case "walk":
               _loc3_ = param2.split(",");
               this.§1t4408s0§ = _loc3_[0];
               §1t3243s0§ = _loc3_[1];
               this.§1t3269s0§(§1t11143s0§);
               if(_loc3_.length >= 3)
               {
                  §1t1557s0§(_loc3_[2]);
               }
               if(_loc3_.length >= 4)
               {
                  this.§1t4515s0§ = _loc3_[3];
               }
               if(_loc3_.length >= 5)
               {
                  this.§1t4516s0§ = int(_loc3_[4]);
               }
               break;
            case "say":
               §1t1559s0§().§1t6288s0§(§1t1521s0§.getString(int(param2)));
               break;
            case "remove":
               §1t1543s0§.§1t10212s0§(this);
               this.§1t4513s0§.destroy();
               break;
            case "setposition":
               if(actionState == §1t11143s0§)
               {
                  actionState = §1t11141s0§;
               }
               _loc3_ = param2.split(",");
               if(_loc3_.length == 2)
               {
                  _loc4_ = int(_loc3_[1]);
               }
               else
               {
                  _loc4_ = §1t1525s0§.§1t4467s0§();
               }
               setPosition(int(_loc3_[0]),_loc4_);
               break;
            case "move":
               velX = int(_loc3_[0]);
               if(_loc3_.length == 2)
               {
                  velY = int(_loc3_[1]);
               }
               else
               {
                  velY = 0;
               }
               this.§1t3269s0§(§1t11193s0§);
               break;
            case "addemitter":
               _loc3_ = param2.split(",");
               §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(int(_loc3_[0])),§1t1525s0§.§1t9942s0§(),int(_loc3_[1]));
               §1t3248s0§.§1t2253s0§(int(_loc3_[2]));
               break;
            case "removeemitter":
               if(§1t3248s0§ != null)
               {
                  §1t3248s0§.destroy();
               }
               break;
            case "darkblur":
               if(param2 == "0")
               {
                  §1t1643s0§.§1t3311s0§(§1t1559s0§());
               }
               else
               {
                  §1t1643s0§.§1t11217s0§(§1t1559s0§(),-200,4);
               }
         }
      }
      
      public function §1t4517s0§(param1:§1t379s0§) : *
      {
         this.§1t4513s0§ = param1;
      }
      
      override public function §1t3298s0§() : *
      {
      }
      
      override public function §1t3277s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         switch(param1)
         {
            case mcs.§1t6231s0§[§1t75s0§.§1t12394s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12393s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12389s0§]:
               §1t1071s0§ = true;
               §1t3256s0§ = true;
               break;
            case mcs.§1t6231s0§[§1t75s0§.§1t12380s0§]:
               §1t3256s0§ = false;
               damage = 0;
               return false;
            default:
               §1t3256s0§ = true;
         }
         return true;
      }
   }
}

