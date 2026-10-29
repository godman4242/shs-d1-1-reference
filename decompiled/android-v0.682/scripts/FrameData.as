package
{
   import flash.display.MovieClip;
   
   public class FrameData
   {
      
      public var reorder:Boolean = false;
      
      public var nodeList:Vector.<FrameNodeData> = new Vector.<FrameNodeData>();
      
      public function FrameData(xml:XML)
      {
         super();
         if(xml.@r.toString() != "")
         {
            this.reorder = xml.@r == 1;
         }
         var max:int = xml.n.length();
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            this.nodeList.push(new FrameNodeData(xml.n[i]));
         }
         this.nodeList.fixed = true;
      }
      
      public function setPosition(mcs:MCSCharacter) : *
      {
         var node:FrameNodeData = null;
         var id:int = 0;
         var max:int = int(this.nodeList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            node = this.nodeList[i];
            id = node.id;
            node.setPosition(mcs.getPart(id));
            if(id == MCSCharacter.PART_pelvic)
            {
               node.setPosition(mcs.getPart(MCSCharacter.PART_crotch));
            }
            else if(id == MCSCharacter.PART_head)
            {
               node.setPosition(mcs.getPart(MCSCharacter.PART_hat));
            }
         }
         if(this.reorder)
         {
            this.reorderLayers(mcs);
         }
      }
      
      public function reorderLayers(mcs:MCSCharacter) : *
      {
         var id:int = 0;
         var mc:MovieClip = null;
         var max:int = int(this.nodeList.length);
         var layerindex:* = 0;
         for(var i:int = 0; i < max; i++)
         {
            id = this.nodeList[i].id;
            mc = mcs.getPart(id);
            mcs.setChildIndex(mc,layerindex++);
            if(id == MCSCharacter.PART_head)
            {
               mcs.setChildIndex(mcs.partList[MCSCharacter.PART_hat],layerindex++);
            }
            else if(id == MCSCharacter.PART_l_calf)
            {
               mcs.setChildIndex(mcs.partList[MCSCharacter.PART_crotch],layerindex++);
            }
         }
      }
      
      public function setVisible(mcs:MCSCharacter) : *
      {
         var i:int = 0;
         var partMax:int = 22;
         for(i = 0; i < partMax; i++)
         {
            mcs.getPart(i).visible = false;
         }
         var max:int = int(this.nodeList.length);
         for(i = 0; i < max; i++)
         {
            mcs.getPart(this.nodeList[i].id).visible = true;
         }
         mcs.partList[MCSCharacter.PART_hat].visible = true;
         mcs.partList[MCSCharacter.PART_crotch].visible = true;
      }
   }
}

