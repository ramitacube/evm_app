import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class AdLayoutX {
  static AdLayoutBuilder get adBannerLayoutBuilder => (ratingBar, media, icon,
          headline, advertiser, body, price, store, attribution, button) {
        return AdLinearLayout(
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          decoration: AdDecoration(
            backgroundColor: Colors.transparent,
          ),
          width: MATCH_PARENT,
          height: MATCH_PARENT,
          orientation: HORIZONTAL,
          gravity: LayoutGravity.center_vertical,
          children: [
            icon,
            AdExpanded(
              flex: 2,
              child: AdLinearLayout(
                width: WRAP_CONTENT,
                margin: EdgeInsets.symmetric(horizontal: 4),
                children: [
                  headline,
                  AdLinearLayout(
                    orientation: HORIZONTAL,
                    children: [attribution, advertiser],
                  ),
                ],
              ),
            ),
            AdExpanded(flex: 4, child: button),
          ],
        );
      };
  static AdLayoutBuilder get mediumAdTemplateLayoutBuilder {
    return (ratingBar, media, icon, headline, advertiser, body, price, store,
        attribution, button) {
      return AdLinearLayout(
        decoration: AdDecoration(backgroundColor: Colors.transparent),
        width: MATCH_PARENT,
        height: MATCH_PARENT,
        gravity: LayoutGravity.center_vertical,
        padding: EdgeInsets.all(8.0),
        children: [
          attribution,
          AdLinearLayout(
            padding: EdgeInsets.only(top: 6.0),
            height: WRAP_CONTENT,
            orientation: HORIZONTAL,
            children: [
              icon,
              AdExpanded(
                flex: 2,
                child: AdLinearLayout(
                  width: WRAP_CONTENT,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  children: [headline, body, advertiser],
                ),
              ),
            ],
          ),
          media,
          button
        ],
      );
    };
  }

  static AdLayoutBuilder get fullBuilder => (ratingBar, media, icon, headline,
          advertiser, body, price, store, attribuition, button) {
        return AdLinearLayout(
          padding: EdgeInsets.all(10),

          // The first linear layout width needs to be extended to the
          // parents height, otherwise the children won't fit good
          width: MATCH_PARENT,
          decoration: AdDecoration(
              borderRadius: AdBorderRadius.all(12),
              gradient: AdLinearGradient(
                colors: [Colors.blue[300], Colors.blue[700]],
                orientation: AdGradientOrientation.tl_br,
              )),
          children: [
            media,
            AdLinearLayout(
              children: [
                icon,
                AdLinearLayout(children: [
                  headline,
                  AdLinearLayout(
                    children: [attribuition, advertiser, ratingBar],
                    orientation: HORIZONTAL,
                    width: MATCH_PARENT,
                  ),
                ], margin: EdgeInsets.only(left: 4)),
              ],
              gravity: LayoutGravity.center_horizontal,
              width: WRAP_CONTENT,
              orientation: HORIZONTAL,
              margin: EdgeInsets.only(top: 6),
            ),
            AdLinearLayout(
              children: [button],
              orientation: HORIZONTAL,
            ),
          ],
        );
      };

  static AdLayoutBuilder get secondBuilder => (ratingBar, media, icon, headline,
          advertiser, body, price, store, attribution, button) {
        return AdLinearLayout(
          padding: EdgeInsets.all(10),
          // The first linear layout width needs to be extended to the
          // parents height, otherwise the children won't fit good
          width: MATCH_PARENT,
          orientation: HORIZONTAL,
          decoration: AdDecoration(
            borderRadius: AdBorderRadius.all(12),
            gradient: AdRadialGradient(
              colors: [Colors.blue[300], Colors.blue[700]],
              center: Alignment(0.5, 0.5),
              radius: 1000,
            ),
          ),
          children: [
            icon,
            AdLinearLayout(
              children: [
                headline,
                AdLinearLayout(
                  children: [attribution, advertiser, ratingBar],
                  orientation: HORIZONTAL,
                  width: WRAP_CONTENT,
                  height: 20,
                ),
                button,
              ],
              margin: EdgeInsets.symmetric(horizontal: 4),
            ),
          ],
        );
      };
}
