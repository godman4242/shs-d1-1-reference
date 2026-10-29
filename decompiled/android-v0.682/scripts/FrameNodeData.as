package
{
   import flash.display.MovieClip;
   import flash.geom.Matrix;
   
   public class FrameNodeData
   {
      
      internal static var identityMatrix:Matrix = new Matrix(1,0,0,1,0,0);
      
      public var id:int;
      
      public var x:int;
      
      public var y:int;
      
      public var rotation:int = 999;
      
      public var matA:int;
      
      public var matB:int;
      
      public var matC:int;
      
      public var matD:int;
      
      public function FrameNodeData(xml:XML)
      {
         super();
         this.x = xml.@x;
         this.y = xml.@y;
         if(xml.@r.toString() == "")
         {
            this.matA = xml.@a;
            this.matB = xml.@b;
            this.matC = xml.@c;
            this.matD = xml.@d;
         }
         else
         {
            this.rotation = xml.@r;
         }
         this.id = xml.@i;
      }
      
      public function setPosition(mc:MovieClip) : *
      {
         var m:Matrix = null;
         if(mc == null || !mc.visible)
         {
            return;
         }
         if(this.rotation != 999)
         {
            if(mc.skewed)
            {
               mc.transform.matrix = identityMatrix;
               mc.skewed = false;
            }
            mc.x = this.x;
            mc.y = this.y;
            mc.rotation = this.rotation;
         }
         else
         {
            m = mc.transform.matrix;
            m.a = this.matA / 100;
            m.b = this.matB / 100;
            m.c = this.matC / 100;
            m.d = this.matD / 100;
            m.tx = this.x;
            m.ty = this.y;
            mc.transform.matrix = m;
            mc.skewed = true;
         }
      }
   }
}

