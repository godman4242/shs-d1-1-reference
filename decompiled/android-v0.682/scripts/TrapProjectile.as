package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1642")]
   public class TrapProjectile extends Projectile
   {
      
      internal var traptype:int;
      
      internal var npcMode:Boolean;
      
      public function TrapProjectile(type:int)
      {
         super();
         addFrameScript(0,this.frame1);
         this.traptype = type;
         gotoAndStop(type + 1);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         visible = true;
         ttl = 24 * 30;
         this.owner = owner;
         damageObj = new Damage();
         if(this.traptype == 0)
         {
            damageObj.setLaunchType(Damage.LAUNCH_KNOCKDOWN);
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
            damageObj.setAttackerLvl(0);
         }
         else if(this.traptype == 1)
         {
            damageObj.setFireDamage(damage);
         }
         else if(this.traptype == 2)
         {
            damageObj.setWaterDamage(damage);
         }
         else if(this.traptype == 3)
         {
            damageObj.setWindDamage(damage);
         }
         else if(this.traptype == 4)
         {
            damageObj.setEarthDamage(damage);
         }
      }
      
      public function setNPCMode() : *
      {
         this.npcMode = true;
         visible = false;
      }
      
      override public function update() : *
      {
         --ttl;
         if(ttl == 0)
         {
            this.removeProjectile();
            return;
         }
         if(this.npcMode)
         {
            if(NPCManager.checkPlayerHitObject(this,damageObj))
            {
               ProjectileManager.createProjectile(ProjectileManager.PROJ_TRAPEXPLOSION,this.x + StageManager.getStagePosition(),this.y,0,0,0,0,null);
               this.removeProjectile();
            }
         }
         else if(isFriendly() && NPCManager.checkHitTrap(this,damageObj))
         {
            ProjectileManager.createProjectile(ProjectileManager.PROJ_TRAPEXPLOSION,this.x + StageManager.getStagePosition(),this.y,0,0,0,0,null);
            if(NetworkManager.instance.isP2P())
            {
               NetworkManager.instance.createDuelProjectile(ProjectileManager.PROJ_TRAPEXPLOSION,this.x + StageManager.getStagePosition(),this.y,0,0,0,0);
            }
            NPCManager.externalRedFreezeCheck();
            this.removeProjectile();
         }
      }
      
      override internal function removeProjectile() : *
      {
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

