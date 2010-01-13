/*
 * ChartsView.j
 * LPKit
 *
 * Created by Ludwig Pettersson on January 13, 2010.
 */


@implementation ChartsView : CPView
{

}

- (void)initWithFrame:(CGRect)aFrame
{
    if (self = [super initWithFrame:aFrame])
    {
        /*

            LPSparkLine

        */

        var sparkLineLabel = [CPTextField labelWithTitle:@"LPSparkLine"];
        [sparkLineLabel setFrameOrigin:CGPointMake(680, 70)];
        [self addSubview:sparkLineLabel];

        var sparkLine = [[LPSparkLine alloc] initWithFrame:CGRectMake(680, 100, 100, 30)];
        [sparkLine setLineWeight:2.0];
        [sparkLine setLineColor:[CPColor colorWithHexString:@"aad8ff"]];
        [sparkLine setShadowColor:[CPColor colorWithHexString:@"999"]];
        [sparkLine setData:[10,25,30,42,10,30,22,70,30,21,44,21,77,55,88,54]];
        [self addSubview:sparkLine];
    }
    return self;
}

@end