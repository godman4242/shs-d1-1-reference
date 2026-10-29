package
{
   import flash.display.MovieClip;
   
   public class §1t7817s0§ extends MovieClip
   {
      
      internal var troopList:Array;
      
      internal var dir:int;
      
      public function §1t7817s0§()
      {
         var _loc2_:§1t75s0§ = null;
         this.troopList = new Array();
         super();
         this.mouseEnabled = false;
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            _loc2_ = new §1t75s0§();
            this.troopList.push(_loc2_);
            addChild(_loc2_);
            _loc2_.x = Math.random() * 100 - 50;
            _loc1_++;
         }
         scaleX = 0.4;
         scaleY = 0.4;
      }
      
      public function initSide(param1:int) : *
      {
         var _loc2_:§1t76s0§ = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < 5)
         {
            if(param1 == 1)
            {
               _loc3_ = 200;
            }
            else if(param1 == 2)
            {
               _loc3_ = 400;
            }
            else if(param1 == 3)
            {
               _loc3_ = 300;
            }
            else if(param1 == 4)
            {
               _loc3_ = 500;
            }
            else
            {
               _loc3_ = 600;
            }
            _loc2_ = §1t1524s0§.§1t9874s0§(_loc3_ + _loc4_);
            this.troopList[_loc4_].§1t6261s0§();
            this.troopList[_loc4_].§1t1550s0§(_loc2_.mcs);
            _loc4_++;
         }
         this.troopList[0].§1t1557s0§("walkwithknife");
         this.troopList[1].§1t1557s0§("walkwithbow");
         this.troopList[2].§1t1557s0§("walkwithkatana");
         this.troopList[3].§1t1557s0§("walkwithspear");
         this.troopList[4].§1t1557s0§("holdshieldwalk");
      }
      
      public function update() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            this.troopList[_loc1_].§1t3268s0§();
            _loc1_++;
         }
         this.moveDir();
      }
      
      public function §1t5492s0§() : *
      {
         scaleX = -0.4;
      }
      
      public function §1t5493s0§() : *
      {
         scaleX = 0.4;
      }
      
      public function setDirection(param1:int) : *
      {
         this.dir = param1;
         if(param1 == 30)
         {
            x -= 24;
            y += 24;
         }
         else if(param1 == 90)
         {
            x -= 24;
         }
         else if(param1 == 150)
         {
            x -= 24;
            y -= 24;
         }
         else if(param1 == -150)
         {
            x += 24;
            y -= 24;
         }
         else if(param1 == -90)
         {
            x += 24;
         }
         else if(param1 == -30)
         {
            x += 24;
            y += 24;
         }
         else if(param1 == 180)
         {
         }
      }
      
      internal function moveDir() : *
      {
         if(this.dir == 30)
         {
            x += 2;
            y -= 2;
         }
         else if(this.dir == 90)
         {
            x += 2;
         }
         else if(this.dir == 150)
         {
            x += 2;
            y += 2;
         }
         else if(this.dir == -150)
         {
            x -= 2;
            y += 2;
         }
         else if(this.dir == -90)
         {
            x -= 2;
         }
         else if(this.dir == -30)
         {
            x -= 2;
            y -= 2;
         }
         else if(this.dir == 180)
         {
         }
      }
   }
}

