import 'package:logging/logging.dart';

final Logger log = new Logger('issuer');

class Issuer{

  // Shared issuer parameters:
  final ip;
  // Application-specific attribute information:
  final _as;
  // Device-protected Boolean
  final bool d;
  // d's Device parameters
  final dps;

  // Private key y0.
  var _y0;

  Issuer(this.ip, this._as, this.d, this.dps) {
    log.info("Construction of Issuer");
  }

  computeXt() {
    // TODO: change to actual computation
    var Xt =
      "393235a85f3de415bd1b25f1e2438923f51c74b7b37d2113b4b6add98a8d48e6";
    return Xt;
  }

  computeXis() {
    // TODO: change to actual computation
    return {
      'x1' : '3e4668267d6a6fe778ec3a189b384b44d029f3edc3532d618b88a729adaea673',
      'x2' : 'af93c647ca51d4c950a616f6aa4cca9c3995589b0710783c3e3a513caf244772',
      'x3' : '58f98bdb5985d501eac1de1057505c3782948c1b5949261d67cdeddf1bf49a5c',
      'x4' : '1',
      'x5' : '499602d2'
    };
  }

  computeGamma() {
    // TODO: change to actual computation
    return "5c220bcfdb187a5275df08b6e202cac2d2e0a89c52a1d1f49706e3ac24d0f5a4a1ff2a8ad72ccec0c006bb567b439b4e8c4bee41c83843f59e19e95fcd5eb8ee2682af367e0c8e032dc83d6ccb6a66bd9c74c430adcfe3053994947b15a2f36e5e4a34732ce9dbe654c001187038aca23d1c11ba810b4f434707720c03b2db0ca80056ea5e9e5d09926b3e046333097c52620b4ad0936773ef12a55822e977f3445038b791c38f318a0b417485c8ecd55e355797f9d3561cf850f4da52ada2f068cf45e56c110a2f3c46787ecc91fb812a1ce2d77dda3ecc74621aa0eb06829e754abfb2876544cbf172947ccf174592c24bf8c063eafc17b6ff2be54b9f33a5";
  }

  choosePrivateKey() {
    // TODO: change to actual computation: choose y0 \in Zq
    _y0 = "109bd1d5ada4f59e7d0dfb947faf16f05c0840067f9f1df1061ff45bc7c20fb";
  }

  var sigmaZ;

  buildZeroKnowledgeProofOfPrivateKey() {
    // TODO: change to actual computation: sigmaZ = gamma^y0
    sigmaZ = "44cf6aa41e4fd2f35c61ef7372ea65b08007765b56d1703cb6c213b9fcf3be495d06e5ba2a1302d0b48727dd603ef672cfc1cdc46b0cbc76f1e9fb08116edeebc7b0c4c4aa927182c32c87e673d6e9c7760feb677c569c5b957429db44bf67b1510c02d4fd6e5e66f56390a5b6c916d431216bddf56cf2ac7d1f3b677b91c5be71310e3eefb1000d4a80a6c365ed08f4a30d49c482705f1ea6ce3d746af368a47dc3a0c33538f839fa3d6203868c4395b1256a9d49f1a01b5cf6510367fd6227a1a67f1176db6e449ddf42e0b71dad045e83628f9c849210d77737d98c46e18d323e2a5ae01810cfcbe754904ff845ac933529eecb64f5d9ea05bc35ada092ac";
  }

  var w;
  var sigmaA;
  var sigmaB;

  generateFirstMsg() {
    log.fine("generating first message");

    // TODO: change to actual computation: w <-R Zq
    w = "109bd1d5ada4f59e7d0dfb947faf16f05c0840067f9f1df1061ff45bc7c20fb";
    sigmaA = "5309c06b43eb8c232b7f3b5177b6b4def38b640201f8860af40754c44e7f459ccb67e50e2aa52f8291bc71727307ff3a79198a8748ac2d09411fd148c80502adf53de069434261557f582e7bf122bf7d8a22ac9180d5da872d8789f1fd31f7d8f40af2db4b87ad60034ea38782c277de2fa489491247dbbaa96748b4ef6b8b061fb13354e6977651c58d289733dd25af1f52e2d68cf47dfda217980181f1cb6df500c71f23dbb69054d7cb4104595d502f58975a98cfade219f12c08f14a2eaab586eed609ad30e567c9209d83e8d814283c2909e4fd8ce0d6019647d548dd2788e21783aa359de64c7f098131c59268a149ac331819873fab8e93c5f2651f2d";
    sigmaB = "7b6472e14460be2197d6d1b3ce2cd04da0410a657be8c7b2f468afecf0e3df0591ffd7998a92a999328bc5476c84a2f650be6322084eef12825b4846a059f500fde7b9d3b858140187a1e6ea2f905112a0784190d754ac8d93a0e7794ccb2750213fafb4339c5d9518deff0980c5d090596dcf8229a3e45749ae8f725f15187b441193f53b40e352d2082f400c0934f8831f1c74085a36b6a7bf6f86ae0b2fc7d8c8d16f65470629aa271666d7a3297107c60ce754e44795c2348818972ad5069b70709213fc49261dd381e60d2c299e7889bb292a861e6f3db986b0b976cad2ed80b8c4ef6ee70d8e1d4a0a47969fcdd2fc056e2dea5b6a07827c911d6e0af4";

    return {
      "sigmaZ": sigmaZ,
      "sigmaA": sigmaA,
      "sigmaB": sigmaB,
    };
  }

  // Variables from the second Message
  var sigmaC;
  receiveSecondMessage(msg) {

    log.info("Received second message");

    sigmaC = msg["sigmaC"];
  }

  var sigmaR;
  generateThirdMessage() {
    sigmaR = "1fc7c7466955095e7d917befe63df8dc03bac3618a700a725dfbcd3d5c368dca";
    w = null;
    return {
      "sigmaR" : sigmaR
    };
  }
}
