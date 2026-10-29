package playerio
{
   import playerio.generated.OneScore;
   import playerio.utils.HTTPChannel;
   
   public class OneScore extends playerio.generated.OneScore
   {
      
      public function OneScore(channel:HTTPChannel, client:Client)
      {
         super(channel,client);
      }
   }
}

