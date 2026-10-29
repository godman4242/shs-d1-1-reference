package
{
   public class Trap_KunaiAuto extends TriggeredAutoStageObject
   {
      
      internal var xvel:Number;
      
      internal var yvel:Number;
      
      internal var kunaiCount:int = 1;
      
      internal var angle:Number;
      
      internal var angleSpread:Number = 0;
      
      internal var speed:int;
      
      internal var kunailvl:int = 1;
      
      public function Trap_KunaiAuto(props:String, objname:String = "")
      {
         super();
         this.props = props;
         if(objname == "")
         {
            objectName = "Trap";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         this.angle = (int(strArray[0]) - 90) * 0.01746;
         this.speed = int(strArray[1]);
         if(strArray.length >= 3)
         {
            this.kunaiCount = int(strArray[2]);
         }
         if(strArray.length >= 4)
         {
            this.angleSpread = int(strArray[3]) * 0.01746;
         }
         if(strArray.length >= 5)
         {
            onDuration = int(strArray[4]);
         }
         if(strArray.length >= 6)
         {
            offDuration = int(strArray[5]);
         }
         if(strArray.length >= 7)
         {
            startInterval = int(strArray[6]);
         }
         if(strArray.length >= 8)
         {
            active = strArray[7] == "1";
         }
         if(strArray.length >= 9 && strArray[8] == "1")
         {
            this.kunailvl = 10;
         }
         this.xvel = this.speed * Math.cos(this.angle);
         this.yvel = this.speed * Math.sin(this.angle);
         timeCounter = offDuration - startInterval;
      }
      
      override internal function doAction() : *
      {
         ProjectileManager.createProjectile(ProjectileManager.PROJ_KUNAI,x + StageManager.getStagePosition(),y,this.xvel,this.yvel,0,this.kunailvl,null);
         for(var i:int = 1; i < this.kunaiCount; i++)
         {
            ProjectileManager.createProjectile(ProjectileManager.PROJ_KUNAI,x + StageManager.getStagePosition(),y,this.speed * Math.cos(this.angle + this.angleSpread * i),this.speed * Math.sin(this.angle + this.angleSpread * i),0,this.kunailvl,null);
         }
      }
   }
}

