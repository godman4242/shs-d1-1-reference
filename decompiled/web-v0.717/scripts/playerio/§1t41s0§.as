package playerio
{
   import §1t51s0§.§1t51s1§.§1t52s0§;
   import playerio.generated.§1t41s0§;
   
   public class §1t41s0§ extends playerio.generated.§1t41s0§
   {
      
      public function §1t41s0§(param1:§1t52s0§, param2:§1t150s0§)
      {
         super(param1,param2);
      }
      
      public function §1t4655s0§(param1:String, param2:String, param3:String, param4:Object, param5:Function = null, param6:Function = null) : void
      {
         _writeError("AS3",param1,param2,param3,param4,param5,param6);
      }
      
      internal function _internal_writeSystemError(param1:String, param2:String, param3:String, param4:Object, param5:Function = null, param6:Function = null) : void
      {
         _writeError("[@SYSTEMERRORLOG@]AS3 Library",param1,param2,param3,param4,param5,param6);
      }
   }
}

