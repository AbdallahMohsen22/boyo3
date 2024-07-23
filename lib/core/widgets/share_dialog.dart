import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';

class ShareDialog extends StatelessWidget {
  final String content;

  const ShareDialog({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.grey[300],
      title: Text('Share'),
      children: <Widget>[
        Text(' Share the ad with your friends.'),
        SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                child: Image.asset('assets/images/whats_app_black.png',height: 40,width: 40,),
                onTap: () {
                  _shareViaWhatsApp();
                  Navigator.pop(context); // Close the share options dialog
                },
              ),
              SizedBox(width: 5,),
              InkWell(
                child: Image.asset('assets/images/instagram_icon_black.png',height: 40,width: 40,),
                onTap: () {
                  _shareViaInstagram();
                  Navigator.pop(context); // Close the share options dialog
                },
              ),
              SizedBox(width: 5,),
              InkWell(
                child: Image.asset('assets/images/twitter_icon_black.png',height: 40,width: 40,),
                onTap: () {
                  _shareViaTwitter();
                  Navigator.pop(context); // Close the share options dialog
                },
              ),
              SizedBox(width: 5,),
              InkWell(
                child: Image.asset('assets/images/linkedin_icon_black.png',height: 40,width: 40,),
                onTap: () {
                  _shareViaLinkedIn();
                  Navigator.pop(context); // Close the share options dialog
                },
              ),
              SizedBox(width: 5,),
              InkWell(
                child: Image.asset('assets/images/facebook_icon_black.png',height: 40,width: 40,),
                onTap: () {
                  _shareViaFacebook();
                  Navigator.pop(context); // Close the share options dialog
                },
              ),
              // SizedBox(width: 5,),
              // InkWell(
              //   child: Image.asset('assets/images/messenger_icon_black.png',height: 40,width: 40,),
              //   onTap: () {
              //     _shareViaMessenger();
              //     Navigator.pop(context); // Close the share options dialog
              //   },
              // ),
              SizedBox(width: 5,),
              InkWell(
                child: Image.asset('assets/images/gmail_icon_black.png',height: 40,width: 40,),
                onTap: () {
                  _shareViaGmail();
                  Navigator.pop(context); // Close the share options dialog
                },
              ),
              SizedBox(width: 5,),
              InkWell(
                child: Image.asset('assets/images/google_icon_black.jpg',height: 40,width: 40,),
                onTap: () {
                  _shareViaGoogle();
                  Navigator.pop(context); // Close the share options dialog
                },
              ),
              SizedBox(width: 10,),


            ],
          ),
        ),
        SizedBox(height: 60,),

        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(
              ColorsManager.gray,
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(
                horizontal:  8.w,
                vertical:  8.h,
              ),
            ),
            fixedSize: MaterialStateProperty.all(
              Size( 90.w, 25.h),
            ),
          ),
          onPressed: (){
            _shareViaWhatsApp();
            Navigator.pop(context);
          },
          child: Text(
            'GO',
            style: TextStyles.font13WhiteBold,
          ),
        ),
      ],
    );
  }

  void _showShareOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.grey[300],
          title: Text('           Share List'),
          children: <Widget>[
            Text(' Share the ad with your friends.'),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    child: Image.asset('assets/images/whats_app_black.png',height: 40,width: 40,),
                    onTap: () {
                      _shareViaWhatsApp();
                      Navigator.pop(context); // Close the share options dialog
                    },
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    child: Image.asset('assets/images/instagram_icon_black.png',height: 40,width: 40,),
                    onTap: () {
                      _shareViaInstagram();
                      Navigator.pop(context); // Close the share options dialog
                    },
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    child: Image.asset('assets/images/twitter_icon_black.png',height: 40,width: 40,),
                    onTap: () {
                      _shareViaTwitter();
                      Navigator.pop(context); // Close the share options dialog
                    },
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    child: Image.asset('assets/images/linkedin_icon_black.png',height: 40,width: 40,),
                    onTap: () {
                      _shareViaLinkedIn();
                      Navigator.pop(context); // Close the share options dialog
                    },
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    child: Image.asset('assets/images/facebook_icon_black.png',height: 40,width: 40,),
                    onTap: () {
                      _shareViaFacebook();
                      Navigator.pop(context); // Close the share options dialog
                    },
                  ),
                  // SizedBox(width: 5,),
                  // InkWell(
                  //   child: Image.asset('assets/images/messenger_icon_black.png',height: 40,width: 40,),
                  //   onTap: () {
                  //     _shareViaMessenger();
                  //     Navigator.pop(context); // Close the share options dialog
                  //   },
                  // ),
                  SizedBox(width: 5,),
                  InkWell(
                    child: Image.asset('assets/images/gmail_icon_black.png',height: 40,width: 40,),
                    onTap: () {
                      _shareViaGmail();
                      Navigator.pop(context); // Close the share options dialog
                    },
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    child: Image.asset('assets/images/google_icon_black.jpg',height: 40,width: 40,),
                    onTap: () {
                      _shareViaGoogle();
                      Navigator.pop(context); // Close the share options dialog
                    },
                  ),
                  SizedBox(width: 10,),


                ],
              ),
            ),
            SizedBox(height: 60,),

            TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                backgroundColor: const MaterialStatePropertyAll(
                  ColorsManager.gray,
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(
                    horizontal:  8.w,
                    vertical:  8.h,
                  ),
                ),
                fixedSize: MaterialStateProperty.all(
                  Size( 90.w, 25.h),
                ),
              ),
              onPressed: (){
                _shareViaWhatsApp();
                Navigator.pop(context);
              },
              child: Text(
                'GO',
                style: TextStyles.font13WhiteBold,
              ),
            ),
          ],
        );
      },
    );
  }

  void _shareViaWhatsApp() {
    Share.share('Check out this awesome content on WhatsApp: $content');
  }

  void _shareViaFacebook() async {
    // Replace with your Facebook sharing logic
    // Example: Launching a Facebook share URL
    String facebookUrl = 'https://www.facebook.com/sharer/sharer.php?u=$content';
    await canLaunch(facebookUrl)
        ? await launch(facebookUrl)
        : throw 'Could not launch $facebookUrl';
  }

  void _shareViaTwitter() async {
    // Replace with your Twitter sharing logic
    // Example: Launching a Twitter share URL
    String twitterUrl = 'https://twitter.com/intent/tweet?text=$content';
    await canLaunch(twitterUrl)
        ? await launch(twitterUrl)
        : throw 'Could not launch $twitterUrl';
  }
  void _shareViaGmail() {
    Share.share(content, subject: 'Check out this content!');
  }

  void _shareViaInstagram() async {
    // Replace with your Instagram sharing logic
    // Example: Launching an Instagram share URL
    String instagramUrl = 'https://www.instagram.com/share?url=$content';
    await canLaunch(instagramUrl)
        ? await launch(instagramUrl)
        : throw 'Could not launch $instagramUrl';
  }

  void _shareViaLinkedIn() async {
    // Replace with your LinkedIn sharing logic
    // Example: Launching a LinkedIn share URL
    String linkedInUrl = 'https://www.linkedin.com/sharing/share-offsite/?url=$content';
    await canLaunch(linkedInUrl)
        ? await launch(linkedInUrl)
        : throw 'Could not launch $linkedInUrl';
  }

  void _shareViaGoogle() async {
    final Uri emailUri = Uri(
      scheme: 'damarota',
      path: 'damarota@gmail.com',
      queryParameters: {
        'subject': 'Check this out!',
        'body': 'https://damarota.com',
      },
    );

    final gmailUrl = emailUri.toString();
    if (await canLaunch(gmailUrl)) {
      await launch(gmailUrl);
    } else {
      // Fallback to share via generic method if Gmail is not installed
      Share.share('Check out this link: https://damarota.com');
    }
  }
  // Future<void> _shareViaMessenger() async {
  //   const messengerUrl = 'fb-messenger://share?link=https:https://damarota.com';
  //   if (await canLaunch(messengerUrl)) {
  //     await launch(messengerUrl);
  //   } else {
  //     // Fallback to share via generic method if Messenger is not installed
  //     Share.share('Check out this link: https://damarota.com');
  //   }
  // }

}
