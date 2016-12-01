import 'package:logging/logging.dart';

final Logger log = new Logger('Prover');

class Prover{

  // Shared issuer parameters:
  final ip;
  // Application-specific attribute information:
  final _as;
  // Device-protected Boolean
  final bool d;
  // d's Device parameters
  final dps;

  Prover( this.ip, this._as, this.d, this.dps) {
    log.info("Construction of Prover");

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

  // Information field value
  var pi;
  buildInformationField() {
    // TODO: change to actual computation
    pi = "50726f76657220696e666f726d6174696f6e206669656c642076616c7565";
    return pi;
  }

  // Random variables of Zq and Zq*
  var alpha, beta1, beta2;
  // Calculated variables
  var h, alphaInverse, t1, t2;
  // Variables in the message
  var sigmaZ;
  var sigmaA;
  var sigmaB;

  receiveFirstMessage(msg) {
    // TODO: change to actual computation (generate at random from Zq*
    // and Zq.

    // Generate alpha at random from Zq*
    alpha = "d7a5d28e6cb885eb94412395de2260ebc3bf67420758b673fa6981ee99dc7b8";
    // Generate beta1 and beta2 at random from Zq
    beta1 = "4d771830d3574ad98ed878da5088093733746e6f3ed56098eef5e93f3369751b";
    beta2 = "7d5aece5c9f63a64f01de548fdb017b79c61eb742f577978177f41dd6e0aa525";
    // Calculate h:
    h = "61b2261a257190a3b2b4a2f832b9c131300fb8b05f306755ff6366eaf3474a259c794f4d69ba6461e74ef7fe9c1a0d6bc551e5705b748def97f72cc93db3653445b23f6606a11d7e24106c24d264cc218345622adb49c07ff5cf22d3db94cb96df3f5b9af2287f586254e920a8912379bd66c5fed14fe4c97c83d9f3ff0f95f671d0569caf7d4bcd8db5fe237c9cadd0148fdd79e42cde53be3ae31a8c3512bb15ee26138278872ff8353a8f846d30745f98a765486878fca1b113b277fa304b2ca89236d2a6234212351ae5d969797d9ffac7538899df97c8e1d2e4b11b422c436b7f4781f9040e3dfa15d77e02e48ad4e8356e464da6e424b82977974be716";
    // Calculate t1 and t2
    // Compute alphaInverse mod q
    alphaInverse = "9257aec1700b294b0d3aceb46eb1c99cbd0b0eced80fa9281054649c87476aad";

    // Receive first message:
    sigmaZ = msg["sigmaZ"];
    sigmaA = msg["sigmaA"];
    sigmaB = msg["sigmaB"];
  }

  // Calculated variables when generating secondMessage
  var
    sigmaZprime,
    sigmaAprime,
    sigmaBprime,
    sigmaCprime,
    sigmaC;

  generateSecondMessage() {
    sigmaZprime = "af883f5a2aa876a859564dd60b5789b34b88de622157b0567c758a7e5f0f91a9489ac1208d745e771928ac3176cfff3d86d510cec6aaf59007601d899eb0659202eb60794a086049cf8aba86f4039689545987ef9ab8b084e8489fce2f93113af97de6e798487aab7bc364770346ed131250ab466797949501f217d2070768d4dac78f8be18b586285cb7bb71d1e4dd532fb32cff17ec0b15099dfb9823b910235f22bc76f0ed6ac2395e9f12d02bf3aa46915f5f913d94cec16ad0ee7f2d37f40b22ed203c946c665dbe1fa09fa2d6a147a3b1f2ed5d56d181ab2b41714c12e744841c87db90dcfacf0b05966edd46b8129bd5de13bcf114ed451f584c86cc4";
    sigmaAprime = "2d975842f768747315d5815f01250c55c691bb753e1303bf0117599b11c63518ada712e64e0417ee52b17a98f16f982ea4024184f2f27619c8d091dd494528e26be8c218f532ae2649b247f37f1a5ac70ccda7461b64f7fcf212031094925ef48e8a6ba35dfcd71c4b26a0dd1237a3d7b60e89da16fa6866507886fe9869fbc93a62cb1b2068412e597c127b4961d4459ff3d8d80f2bc05ec69fc0b8fc45ef03c04ac160374450fec0a2deec8b0d10193f97bf938aca81e5ffb4ab5d968699b19845615187809ea2fa1880271d8ffc6bdc756f79bd1d854dcea9190d76aa98c62b3858d26680f12ab91b0fdf9adec254fa449352cadaf7dc64f45802ed05147c";
    sigmaBprime = "5eec38511d7bbd71e4c460c481547130f1b3958298948b0304004b86624f56f84ee3f24d0a9c2d70a2759443f69232ba7e4cd1ddb71abf2ed3feaedb44d5ce1a5385c4c69e680fbe4f0612440839d8d37fcb05160f44f57db0ea0b0ec48a2ad473338d94b5568baa18d2871452681633fcd5dcfa889cbcf34049214a553709244ad9a776cc76fd1590be1f2b6e082d0e91675cb1f005fca0596bd67f754dfaf789748ba3df505167714c4dc46da93c3d76d6f1d9d3729866c751b253ddaa9a4a1add3814ebef9d26351eb8f77da739a80866f898a936dc2f5c92fc6b0bda23092d215e9ad2bc4d312034b0a1c8fe2575f5f91fbf838e0770d50b0b2d0b492cec";
    sigmaCprime = "f88bae5a893daf1885f1ace46f3686218b7762f617b9174b72da371628eab5d";
    sigmaC = "5cffd3167beb25cb173793a8977b71994c2be49ea050f20da6238cb095f82078";

    return {
      "sigmaC" : sigmaC
    };
  }

  // Variable recieved from third message
  var sigmaR;
  // Calculated variable when receiving the third message
  var sigmaRprime;
  receiveThirdMessage(msg) {
    sigmaR = msg["sigmaR"];

    sigmaRprime = "9d22b42c334b43c36daf6138e3ee1093a01caed5b9c783ea757b0f1aca4132ef";
  }

  verifySignature() {
    // TODO verify sigmaAprime * sigmaBprime = ...
    return true;
  }

  generateUProveToken() {
    // Delete unecessary variables:
    //WRONG DOCUMENTATION (there is no beta0): beta0 = null;
    beta1 = null;
    beta2 = null;
    t1 = null; t2 = null;

    return {
      "U-Prove token" : {
        "UIDp": ip["UIDp"],
        "h" : h,
        "TI": _as["TI"],
        "PI": pi,
        "sigmaZprime" : sigmaZprime,
        "sigmaCprime" : sigmaCprime,
        "sigmaRprime" : sigmaRprime,
        "d" : d
      },
      "Private key"   : alphaInverse
    };
  }

  verifyUProveToken() {
  }

  chooseAttributes() {
  }

}
