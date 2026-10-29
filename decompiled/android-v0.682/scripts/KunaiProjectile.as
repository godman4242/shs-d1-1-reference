package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1708")]
   public class KunaiProjectile extends Projectile
   {
      
      internal var kunaitype:int;
      
      public function KunaiProjectile(type:int)
      {
         super();
         addFrameScript(0,this.frame1);
         this.kunaitype = type;
         gotoAndStop(type + 1);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         visible = true;
         breakable = true;
         flying = true;
         this.velX = velX;
         this.velY = velY;
         ttl = ttlMax;
         this.owner = owner;
         if(velX < 0)
         {
            scaleX = -1;
         }
         else
         {
            scaleX = 1;
         }
         rotation = Math.atan(velY / velX) * 57.2727;
         damageObj = new Damage();
         if(this.kunaitype == 0)
         {
            if(skilllevel == 1)
            {
               damageObj.setDamage(20);
            }
            else if(skilllevel == 2)
            {
               damageObj.setDamage(40);
            }
            else if(skilllevel == 3)
            {
               damageObj.setDamage(60);
            }
            else if(skilllevel == 10)
            {
               damageObj.setDamage(10000);
            }
            damageObj.setAttackerLvl(0);
         }
         else if(this.kunaitype == 1)
         {
            damageObj.setFireDamage(damage);
         }
         else if(this.kunaitype == 2)
         {
            damageObj.setWaterDamage(damage);
         }
         else if(this.kunaitype == 3)
         {
            damageObj.setWindDamage(damage);
         }
         else if(this.kunaitype == 4)
         {
            damageObj.setEarthDamage(damage);
         }
         this.owner = owner;
      }
      
      override public function update() : *
      {
         if(!flying)
         {
            doDisappear();
            return;
         }
         x += velX;
         y += velY;
         if(y < -10 || velX < 0 && x < -10 || velX > 0 && x > StatsManager.stageWidth + 10)
         {
            this.removeProjectile();
            return;
         }
         if(breakable)
         {
            if(y > StageManager.getGroundY())
            {
               flying = false;
               return;
            }
            if(isFriendly())
            {
               if(NPCManager.checkHitObject(this,damageObj))
               {
                  this.removeProjectile();
               }
            }
            else if(NPCManager.checkPlayerHitObject(this,damageObj,100,false,null,owner))
            {
               this.removeProjectile();
            }
         }
         else
         {
            if(velX > 0)
            {
               rotation += 20;
            }
            else
            {
               rotation -= 20;
            }
            velY += GRAVITY;
         }
      }
      
      override public function doBreak() : *
      {
         breakable = false;
         velX = Math.random() * 30 - 15;
         velY = -(Math.random() * 5 + 5);
         gotoAndStop("broken");
         ProjectileManager.createBladeSlashFx(x,y);
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

