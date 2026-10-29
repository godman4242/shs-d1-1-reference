package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2141")]
   public class Trap_Kunai extends TriggeredStageObject
   {
      
      internal var xvel:Number;
      
      internal var yvel:Number;
      
      internal var kunaiCount:int = 1;
      
      internal var angle:Number;
      
      internal var angleSpread:Number = 0;
      
      internal var speed:int;
      
      internal var kunailvl:int = 1;
      
      public function Trap_Kunai(props:String, objname:String = "")
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
         if(strArray.length >= 5 && strArray[4] == "1")
         {
            this.kunailvl = 10;
         }
         this.xvel = this.speed * Math.cos(this.angle);
         this.yvel = this.speed * Math.sin(this.angle);
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

