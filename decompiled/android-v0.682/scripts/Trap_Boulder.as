package
{
   public class Trap_Boulder extends TriggeredStageObject
   {
      
      internal var xvel:Number = 10;
      
      internal var yvel:Number = 0;
      
      internal var damage:int = 50;
      
      public function Trap_Boulder(props:String, objname:String = "")
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
         if(strArray.length >= 1)
         {
            this.xvel = int(strArray[0]);
         }
         if(strArray.length >= 2)
         {
            this.yvel = int(strArray[1]);
         }
         if(strArray.length >= 3 && strArray[2] == "1")
         {
            this.damage = 1000;
         }
      }
      
      override internal function doAction() : *
      {
         ProjectileManager.createProjectile(ProjectileManager.PROJ_BOULDER,x + StageManager.getStagePosition(),y,this.xvel,this.yvel,this.damage,1,null);
      }
   }
}

