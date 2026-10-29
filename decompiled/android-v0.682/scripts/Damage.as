package
{
   public class Damage
   {
      
      public static var LAUNCH_NONE:int = 0;
      
      public static var LAUNCH_AIR:int = 1;
      
      public static var LAUNCH_KNOCKDOWN:int = 2;
      
      public static var LAUNCH_FLY:int = 3;
      
      public static var LAUNCH_FLYAWAY:int = 4;
      
      public static var KNEEGROIN:int = 5;
      
      public static var STUN:int = 6;
      
      public static var DEATHTOUCH:int = 7;
      
      public static var SUBSTITUTIONLOG:int = 8;
      
      public static var BACKTHROW:int = 9;
      
      internal var damage:int;
      
      internal var stance:int;
      
      internal var launchType:int;
      
      internal var attackerlvl:int;
      
      internal var piercingDamage:int = 0;
      
      internal var fireDamage:int = 0;
      
      internal var waterDamage:int = 0;
      
      internal var windDamage:int = 0;
      
      internal var earthDamage:int = 0;
      
      internal var flyVelX:int = 0;
      
      internal var flyVelY:int = 0;
      
      internal var victimPosX:int = -1;
      
      public function Damage(damage:int = 0, attackerlvl:int = 0, launchType:int = 0, stance:int = -1, fireDamage:int = 0, waterDamage:int = 0, windDamage:int = 0, earthDamage:int = 0)
      {
         super();
         this.damage = damage;
         this.launchType = launchType;
         this.attackerlvl = attackerlvl;
         this.stance = stance;
         this.fireDamage = fireDamage;
         this.waterDamage = waterDamage;
         this.windDamage = windDamage;
         this.earthDamage = earthDamage;
      }
      
      public function setPiercingDamage(num:int) : *
      {
         this.piercingDamage = num;
      }
      
      public function isLaunchAir() : Boolean
      {
         return this.launchType == LAUNCH_AIR;
      }
      
      public function isKnockDown() : Boolean
      {
         return this.launchType == LAUNCH_KNOCKDOWN;
      }
      
      public function isFly() : Boolean
      {
         return this.launchType == LAUNCH_FLY;
      }
      
      public function isFlyAway() : Boolean
      {
         return this.launchType == LAUNCH_FLYAWAY;
      }
      
      public function isKneeGroin() : Boolean
      {
         return this.launchType == KNEEGROIN;
      }
      
      public function isBackThrow() : Boolean
      {
         return this.launchType == BACKTHROW;
      }
      
      public function isStun() : Boolean
      {
         return this.launchType == STUN;
      }
      
      public function isDeathTouch() : Boolean
      {
         return this.launchType == DEATHTOUCH;
      }
      
      public function isSubstitutionLog() : *
      {
         return this.launchType == SUBSTITUTIONLOG;
      }
      
      public function setLaunchDir(facingRight:Boolean) : *
      {
         if(facingRight)
         {
            this.flyVelX = 1;
         }
         else
         {
            this.flyVelX = 0;
         }
      }
      
      public function setFlyVel(velx:int, vely:int) : *
      {
         this.flyVelX = velx;
         this.flyVelY = vely;
      }
      
      public function setFlyAwayPos(posx:int, posy:int) : *
      {
         this.flyVelX = posx;
         this.flyVelY = posy;
      }
      
      public function setStunTime(num:int, stunPosX:int = 0) : *
      {
         this.flyVelX = num;
         this.flyVelY = stunPosX;
      }
      
      public function setSubstitutionLog() : *
      {
         this.damage = 0;
         this.attackerlvl = 0;
         this.launchType = SUBSTITUTIONLOG;
      }
      
      public function getMinDamage() : int
      {
         if(this.damage == 0)
         {
            return 0;
         }
         if(this.attackerlvl == 0)
         {
            return this.damage;
         }
         if(this.attackerlvl <= 10)
         {
            return 1 + this.piercingDamage;
         }
         if(this.attackerlvl <= 20)
         {
            return this.attackerlvl / 8 + this.piercingDamage;
         }
         if(this.attackerlvl <= 30)
         {
            return this.attackerlvl / 6 + this.piercingDamage;
         }
         return this.attackerlvl / 4 + this.piercingDamage;
      }
      
      public function setDamage(num:int) : *
      {
         this.damage = num;
      }
      
      public function setAttackerLvl(num:int) : *
      {
         this.attackerlvl = num;
      }
      
      public function setLaunchType(num:int) : *
      {
         this.launchType = num;
      }
      
      public function setFireDamage(num:int) : *
      {
         this.fireDamage = num;
      }
      
      public function setWaterDamage(num:int) : *
      {
         this.waterDamage = num;
      }
      
      public function setWindDamage(num:int) : *
      {
         this.windDamage = num;
      }
      
      public function setEarthDamage(num:int) : *
      {
         this.earthDamage = num;
      }
      
      public function setVictimPosX(num:int) : *
      {
         this.victimPosX = num;
      }
      
      public function getLaunchedString() : String
      {
         var str:String = "";
         if(this.launchType == LAUNCH_AIR || this.launchType == LAUNCH_KNOCKDOWN)
         {
            str = this.launchType + "," + this.flyVelX;
         }
         else if(this.launchType == LAUNCH_FLY || this.launchType == LAUNCH_FLYAWAY || this.launchType == STUN || this.launchType == DEATHTOUCH)
         {
            str = this.launchType + "," + this.flyVelX + "," + this.flyVelY;
         }
         else if(this.launchType == KNEEGROIN)
         {
            str = this.launchType + "," + this.flyVelX + "," + this.flyVelY + "," + this.attackerlvl;
         }
         else if(this.launchType == BACKTHROW)
         {
            str = this.launchType + "," + this.flyVelX + "," + this.flyVelY;
         }
         else
         {
            str = this.launchType.toString();
         }
         if(this.victimPosX != -1)
         {
            str += "," + this.victimPosX;
         }
         return str;
      }
   }
}

