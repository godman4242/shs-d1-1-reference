package
{
   public class AnimData
   {
      
      public var frameList:Vector.<FrameData> = new Vector.<FrameData>();
      
      public var duration:int = 0;
      
      public var looping:Boolean = false;
      
      public function AnimData(xml:XML)
      {
         super();
         this.duration = xml.@d;
         this.looping = xml.@l == 1;
         var max:int = xml.f.length();
         for(var i:int = 0; i < max; i++)
         {
            this.frameList.push(new FrameData(xml.f[i]));
         }
         this.frameList.fixed = true;
         switch(xml.@i.toString())
         {
            case "light_afterslashpose":
               this.duration += 10;
               break;
            case MCSActor.LIGHTSLASH_POSE:
            case MCSActor.LIGHTSLASHDOWN_POSE:
            case MCSActor.LIGHTSLASHUP_POSE:
            case MCSActor.BALANCEDSLASH_POSE:
            case MCSActor.BALANCEDSLASHDOWN_POSE:
            case MCSActor.BALANCEDSLASHUP_POSE:
            case MCSActor.HEAVYSLASH_POSE:
            case MCSActor.HEAVYSLASHDOWN_POSE:
            case MCSActor.HEAVYSLASHUP_POSE:
            case MCSActor.DUALSLASH_POSE:
            case MCSActor.DUALSLASHDOWN_POSE:
            case MCSActor.DUALSLASHUP_POSE:
            case MCSActor.REVERSEDSLASH_POSE:
               this.duration += 10;
               break;
            case MCSActor.LIGHTFALLSLASH_END:
            case MCSActor.BALANCEDFALLSLASH_END:
            case MCSActor.HEAVYFALLSLASH_END:
            case MCSActor.DUALFALLSLASH_END:
            case MCSActor.REVERSEDFALLSLASH_END:
            case MCSActor.LIGHTJUMPSLASH_LAND:
            case MCSActor.BALANCEDJUMPSLASH_LAND:
            case MCSActor.HEAVYJUMPSLASH_LAND:
            case MCSActor.DUALJUMPSLASH_LAND:
            case MCSActor.REVERSEDJUMPSLASH_LAND:
               this.duration += 15;
               break;
            case "sheathesword":
            case "sheathesword3":
               this.duration += 24;
               break;
            case "deathenemy":
            case "deathnohand":
            case "deathnohead":
            case "defeatedanimationv2":
            case "death":
            case "gob_death":
            case MCSActor.KNEEGROIN_VICTIM:
               this.duration += 6;
               break;
            case "gotlauncheddownedend":
               this.duration += 24;
               break;
            case "downstab_up":
               this.duration += 10;
               break;
            case "katanadropdown":
               this.duration += 4;
               break;
            case "katanaattack":
               this.duration += 8;
               break;
            case "firearrow":
               this.duration += 10;
               break;
            case "throwgrenade":
               this.duration += 12;
               break;
            case "sheathedland":
               this.duration += 6;
               break;
            case "zom_attack":
               this.duration += 6;
               break;
            case "jutsu_blow_parta":
               this.duration += 2;
               break;
            case "stomp_partb":
               this.duration += 20;
               break;
            case "spear_kick_partb":
               this.duration += 2;
               break;
            case "spear_lunge_partb":
               this.duration += 6;
               break;
            case "ogre_nap1_mid":
               this.duration += 48;
               break;
            case "gob_dash_mid":
               this.duration += 6;
               break;
            case "spartakick_start":
               this.duration += 6;
               break;
            case MCSActor.DEATHTOUCH_PARTA:
               this.duration += 50;
               break;
            case MCSActor.FLURRY_POSE:
               this.duration += 24;
               break;
            case MCSActor.CLEAVE_POSE:
               this.duration += 24;
               break;
            case MCSActor.JUTSU_GROUND_PARTB:
               this.duration += 24;
               break;
            case MCSActor.GUARDIAN_STOMPFREEZE:
               this.duration += 24;
               break;
            case MCSActor.AIRSTAB_STAB:
               this.duration += 24;
               break;
            case MCSActor.AIRSTAB_END:
               this.duration += 6;
               break;
            case MCSActor.BULLCHARGE_START:
               this.duration += 12;
               break;
            case MCSActor.PUNCHLUNGE_MID:
               this.duration += 6;
               break;
            case MCSActor.PUNCHLUNGE_END:
               this.duration += 12;
         }
      }
   }
}

