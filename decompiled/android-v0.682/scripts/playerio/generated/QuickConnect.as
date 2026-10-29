package playerio.generated
{
   import flash.events.EventDispatcher;
   import playerio.generated.messages.FacebookOAuthConnectArgs;
   import playerio.generated.messages.FacebookOAuthConnectError;
   import playerio.generated.messages.FacebookOAuthConnectOutput;
   import playerio.generated.messages.KongregateConnectArgs;
   import playerio.generated.messages.KongregateConnectError;
   import playerio.generated.messages.KongregateConnectOutput;
   import playerio.generated.messages.SimpleConnectArgs;
   import playerio.generated.messages.SimpleConnectError;
   import playerio.generated.messages.SimpleConnectOutput;
   import playerio.generated.messages.SimpleGetCaptchaArgs;
   import playerio.generated.messages.SimpleGetCaptchaError;
   import playerio.generated.messages.SimpleGetCaptchaOutput;
   import playerio.generated.messages.SimpleRecoverPasswordArgs;
   import playerio.generated.messages.SimpleRecoverPasswordError;
   import playerio.generated.messages.SimpleRecoverPasswordOutput;
   import playerio.generated.messages.SimpleRegisterArgs;
   import playerio.generated.messages.SimpleRegisterError;
   import playerio.generated.messages.SimpleRegisterOutput;
   import playerio.generated.messages.SimpleUserGetSecureLoginInfoArgs;
   import playerio.generated.messages.SimpleUserGetSecureLoginInfoError;
   import playerio.generated.messages.SimpleUserGetSecureLoginInfoOutput;
   import playerio.generated.messages.SteamConnectArgs;
   import playerio.generated.messages.SteamConnectError;
   import playerio.generated.messages.SteamConnectOutput;
   import playerio.utils.Converter;
   import playerio.utils.HTTPChannel;
   
   public class QuickConnect extends EventDispatcher
   {
      
      protected var channel:HTTPChannel;
      
      public function QuickConnect(channel:HTTPChannel)
      {
         super();
         this.channel = channel;
      }
      
      public function simpleUserGetSecureLoginInfo(callback:Function = null, errorHandler:Function = null) : void
      {
         var input:SimpleUserGetSecureLoginInfoArgs = new SimpleUserGetSecureLoginInfoArgs();
         var output:SimpleUserGetSecureLoginInfoOutput = new SimpleUserGetSecureLoginInfoOutput();
         channel.Request(424,input,output,new SimpleUserGetSecureLoginInfoError(),function(output:SimpleUserGetSecureLoginInfoOutput):void
         {
            if(callback != null)
            {
               callback(output.publicKey,output.nonce);
            }
         },function(error:SimpleUserGetSecureLoginInfoError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      protected function _simpleConnect(gameId:String, usernameOrEmail:String, password:String, playerInsightSegments:Array, clientAPI:String, clientInfo:Object, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:SimpleConnectArgs = new SimpleConnectArgs(gameId,usernameOrEmail,password,playerInsightSegments,clientAPI,Converter.toKeyValueArray(clientInfo));
         var output:SimpleConnectOutput = new SimpleConnectOutput();
         channel.Request(400,input,output,new SimpleConnectError(),function(output:SimpleConnectOutput):void
         {
            if(callback != null)
            {
               callback(output.token,output.userId,output.showBranding,output.gameFSRedirectMap,output.partnerId,output.playerInsightState);
            }
         },function(error:SimpleConnectError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      public function simpleGetCaptcha(gameId:String, width:int, height:int, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:SimpleGetCaptchaArgs = new SimpleGetCaptchaArgs(gameId,width,height);
         var output:SimpleGetCaptchaOutput = new SimpleGetCaptchaOutput();
         channel.Request(415,input,output,new SimpleGetCaptchaError(),function(output:SimpleGetCaptchaOutput):void
         {
            if(callback != null)
            {
               callback(output.captchaKey,output.captchaImageUrl);
            }
         },function(error:SimpleGetCaptchaError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      protected function _simpleRegister(gameId:String, username:String, password:String, email:String, captchaKey:String, captchaValue:String, extraData:Object, partnerId:String, playerInsightSegments:Array, clientAPI:String, clientInfo:Object, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:SimpleRegisterArgs = new SimpleRegisterArgs(gameId,username,password,email,captchaKey,captchaValue,Converter.toKeyValueArray(extraData),partnerId,playerInsightSegments,clientAPI,Converter.toKeyValueArray(clientInfo));
         var output:SimpleRegisterOutput = new SimpleRegisterOutput();
         channel.Request(403,input,output,new SimpleRegisterError(),function(output:SimpleRegisterOutput):void
         {
            if(callback != null)
            {
               callback(output.token,output.userId,output.showBranding,output.gameFSRedirectMap,output.partnerId,output.playerInsightState);
            }
         },function(error:SimpleRegisterError):void
         {
            var e:PlayerIORegistrationError = new PlayerIORegistrationError(error.message,error.errorCode,error.usernameError,error.passwordError,error.emailError,error.captchaError);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      public function simpleRecoverPassword(gameId:String, usernameOrEmail:String, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:SimpleRecoverPasswordArgs = new SimpleRecoverPasswordArgs(gameId,usernameOrEmail);
         var output:SimpleRecoverPasswordOutput = new SimpleRecoverPasswordOutput();
         channel.Request(406,input,output,new SimpleRecoverPasswordError(),function(output:SimpleRecoverPasswordOutput):void
         {
            if(callback != null)
            {
               callback();
            }
         },function(error:SimpleRecoverPasswordError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      protected function _kongregateConnect(gameId:String, userId:String, gameAuthToken:String, playerInsightSegments:Array, clientAPI:String, clientInfo:Object, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:KongregateConnectArgs = new KongregateConnectArgs(gameId,userId,gameAuthToken,playerInsightSegments,clientAPI,Converter.toKeyValueArray(clientInfo));
         var output:KongregateConnectOutput = new KongregateConnectOutput();
         channel.Request(412,input,output,new KongregateConnectError(),function(output:KongregateConnectOutput):void
         {
            if(callback != null)
            {
               callback(output.token,output.userId,output.showBranding,output.gameFSRedirectMap,output.playerInsightState);
            }
         },function(error:KongregateConnectError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      protected function _facebookOAuthConnect(gameId:String, accessToken:String, partnerId:String, playerInsightSegments:Array, clientAPI:String, clientInfo:Object, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:FacebookOAuthConnectArgs = new FacebookOAuthConnectArgs(gameId,accessToken,partnerId,playerInsightSegments,clientAPI,Converter.toKeyValueArray(clientInfo));
         var output:FacebookOAuthConnectOutput = new FacebookOAuthConnectOutput();
         channel.Request(418,input,output,new FacebookOAuthConnectError(),function(output:FacebookOAuthConnectOutput):void
         {
            if(callback != null)
            {
               callback(output.token,output.userId,output.showBranding,output.gameFSRedirectMap,output.facebookUserId,output.partnerId,output.playerInsightState);
            }
         },function(error:FacebookOAuthConnectError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      public function steamConnect(gameId:String, steamAppId:String, steamSessionTicket:String, playerInsightSegments:Array, clientAPI:String, clientInfo:Object, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:SteamConnectArgs = new SteamConnectArgs(gameId,steamAppId,steamSessionTicket,playerInsightSegments,clientAPI,Converter.toKeyValueArray(clientInfo));
         var output:SteamConnectOutput = new SteamConnectOutput();
         channel.Request(421,input,output,new SteamConnectError(),function(output:SteamConnectOutput):void
         {
            if(callback != null)
            {
               callback(output.token,output.userId,output.showBranding,output.gameFSRedirectMap,output.partnerId,output.playerInsightState);
            }
         },function(error:SteamConnectError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
   }
}

