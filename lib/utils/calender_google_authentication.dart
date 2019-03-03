import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

class CalenderGoogleAuthentication{
    final serviceAccountCredentials = ServiceAccountCredentials.fromJson({
      "private_key_id": "2f49dfa34c9d86ea892356d86f4705ef3522f3f9",
      "private_key": "-----BEGIN PRIVATE KEY-----"
          "\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCxW9SsgWY8HRG/"
          "\nhlgU4JbxDUR1W2kmeRG2Ue3WcUMt1wCW4WxHwiuTVuc0eFvtLVUFFlxMzFajZnz6"
          "\nPZ8leL3wsWFPlzhIaaUSHo25T86HZeK8q1EPqDibv6CRfLYMZ1sXrFUHXCYhbU+b"
          "\nCVfqzP8knKBDOCjhCpFSY0AvAevvLLu7tVqGY8zrCcB6DpPOaP8zm1U507IC2sc5"
          "\nahlJE9fUXnF7CmxyPwI/lZaNlJY8Czd7v/bDSBDrIDEVCVAIjIQAyY1FT8WPmFbZ"
          "\nCbfaycsBhRqiSAKLfRYHasQuoUMHGIJUj4KCZawOgscTypZxaX3Nmv1v18SCo6Cg"
          "\nXOPbcStNAgMBAAECggEAAUcACR4FdnlfH1oAWGYlsCbAT3gREc3dasq8Q8cdDL93"
          "\nqZ6GAR5M4grGL4KOZu7kpdy7XXI7TYH3dHXtJ3/vHkSoxsH4Dc10+uRtcOA6RI9f"
          "\nSqyRMOOtRLHkniefyAcWiN0c36iyPZtj72Hp2C8Rx1m5bcKByN0ins1IMQ56fIZ6"
          "\n173zxAcR9HD3XPR0nt2Vy7wK10eqfNk8RRLYcEDgLGTheEJMLLIVmXvlKZuwR6eN"
          "\nLpTNRJXWJjHH2VbIARvxcsRTLVCsXSo2IHYtQq8AfacmKdltYKjp02+i6xlrGd+v"
          "\nzNtxVVSLFOHv0kFPoj+Utngh3bQN8EODihKIZiuDAQKBgQD6PQjkdGIpVNKYUhuP"
          "\nVjKSVoVP+eMP8AW2QfKke3LAPn0kCjV13soi3PFkR3o11M2ai1DqDr7VpYKy5qA7"
          "\nX6AlfVkXpqgf+ekuvMffL9NE5mWg6nL9bSZiP6zREQvOgvDbwbVmk7XU0gQTOFr0"
          "\nZlaxJRKjg3CdOetJjE3XlR05iQKBgQC1cTm+wl3aFsz1Nzvs+S+O3BbLCoMzJoIE"
          "\n3emegydefXGlxZF5SqNbR8v7OJ/ca6vNrkXpPbMjZAawjpxrf7tA1xZ0uvB/tNRs"
          "\nFZWFwq9g3pKO3xrc74lr/1sLqmsKmFZ4uCTabatHRspAxSCBvWXNt0K+5NpUq7qd"
          "\nz64/9hrmpQKBgQCJBskKyIxEE7WqQTPkPpA8v/IKREzJGmcWUXB8Dzlb+hvuk0SJ"
          "\nAfFwO8pXXiiWt6vKl8U8Fcz8EsDKFC3jtU5tmQEjSVhBAkllFWzhUz/+N6epARjs"
          "\nm0tse2+3n/z2HY+k1qLtw67LFiGzIKX1tOB96k4VidEt11x3DsRFa9rv+QKBgHSK"
          "\nCxr5YKqppm+CUJ0+2EscFg/H6sk53J0fo+RKPUk1rX9aTLvpMs94aA4uKo+7IJh1"
          "\nbTYIiT0cDCfvEY0Cd9WH0Uaco8iC70WU/3rwtxCzJNNbfbeWq1+Qnnv5s9MUUcYs"
          "\nEI+zjSW01EeR1fU/H1pocRiHiayEuNKQCE3Q1yp5AoGANonGsXHJajaz0ekgQCcf"
          "\n/OS/3OEMMl6WkLtggXespW8lMqFQMaM3A1jU60d8hq7ZMZd/st3dezNA9Jm9yvqy"
          "\n2B3jt6ZyH1JXd6/UYosf3Yex/TqyA+3Figl2QPC7CKJECXCzph1Inah08W1ilkcF"
          "\n1E8oQUvCX0TsjjZ8PSZ0B8c="
          "\n-----END PRIVATE KEY-----"
          "\n",
      "client_email": "google-api@periup-deeef.iam.gserviceaccount.com",
      "client_id": "103729608604298448543",
      "type": "service_account"
    });

    var scope = [CalendarApi.CalendarScope];

    void getCalenderEvents() async{
      clientViaServiceAccount(serviceAccountCredentials, scope).then((AuthClient client) {
        print("hello world");
        var calenderApi = CalendarApi(client);
        print(calenderApi.events.toString());
        var personalEvents = calenderApi.events.list(
            "primary",
          singleEvents: true,
          maxResults: 10,
        );

        personalEvents.then((Events events){
          for(int count = 0; count < events.items.length ; count ++){
            print(count.toString() + " " + events.items[count].toString());
          }
        });

        print(personalEvents.toString());
        
        client.close();
      });
    }
}