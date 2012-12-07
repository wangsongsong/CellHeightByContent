

/*wss:
 * 这是一个简单的根据内容多少，改变cell高度的Demo，
 * 环境：xcode4.3,支持自动释放
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize data;

- (void)viewDidLoad
{
    self.data = [NSArray arrayWithObjects:@"wwwwwwwwwwwwwww",@"wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww",@"wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww",@"wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww", nil];
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark ------tableView operate-------

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section 
{
	return [data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    
    //..获取文字高度
    NSString*  str = [data objectAtIndex:row];
    UIFont*   font = [UIFont systemFontOfSize:14];
    CGSize    size = [str sizeWithFont:font 
                     constrainedToSize:CGSizeMake(tableView.frame.size.width,290) 
                         lineBreakMode:UILineBreakModeCharacterWrap];
    return size.height;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    int row = indexPath.row;
    UITableViewCell* cell;
    static NSString* tableIdentifier = @"cell";
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    
    //..获取文字高度
    NSString*  str = [data objectAtIndex:row];
    UIFont*   font = [UIFont systemFontOfSize:14];
    CGSize    size = [str sizeWithFont:font 
                     constrainedToSize:CGSizeMake(tableView.frame.size.width,290) 
                         lineBreakMode:UILineBreakModeCharacterWrap];
    
    UILabel* contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 290, size.height)];
    contentLabel.numberOfLines = 0;
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.text = str;
    contentLabel.backgroundColor = [UIColor clearColor];
    [contentLabel setLineBreakMode:UILineBreakModeCharacterWrap];
    [cell addSubview:contentLabel];
    
	return cell;
}


@end
