

/*wss:
 * 这是一个简单的根据内容多少，改变cell高度的Demo，
 * 环境：xcode4.3,支持自动释放
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSArray* data;
}
@property (nonatomic, retain) NSArray* data;

@end
