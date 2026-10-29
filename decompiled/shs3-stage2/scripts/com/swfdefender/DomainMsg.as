package com.swfdefender
{
   import flash.display.*;
   import flash.text.*;
   
   public class DomainMsg extends Sprite
   {
      
      if(false)
      {
      }
      
      public function DomainMsg(param1:Number, param2:Number, param3:String, param4:uint, param5:Boolean)
      {
         var _loc8_:* = undefined;
         super();
         if(!param5)
         {
            _loc8_ = new Sprite();
            _loc8_.graphics.beginFill(param4);
            _loc8_.graphics.drawRect(0,0,param1,param2);
            _loc8_.graphics.endFill();
            this.addChild(_loc8_);
         }
         var _loc6_:* = new TextField();
         _loc6_.width = param1;
         _loc6_.height = param2;
         _loc6_.multiline = true;
         _loc6_.wordWrap = true;
         _loc6_.selectable = false;
         _loc6_.htmlText = param3;
         _loc6_.autoSize = TextFieldAutoSize.CENTER;
         var _loc7_:TextFormat = new TextFormat();
         _loc7_.align = TextFormatAlign.CENTER;
         _loc6_.setTextFormat(_loc7_);
         _loc6_.x = 0;
         _loc6_.y = param2 / 2 - _loc6_.height / 2;
         this.addChild(_loc6_);
         if(false)
         {
         }
      }
   }
}

if(false)
{
}

