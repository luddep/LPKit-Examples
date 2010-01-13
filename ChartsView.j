/*
 * ChartsView.j
 * LPKit
 *
 * Created by Ludwig Pettersson on January 13, 2010.
 */


@implementation ChartsView : CPView
{
    CPArray values;
    LPChartView chartView;
    CPTextField chartViewHoverLabel;
    
    CPArray pieChartValues;
    CPTextField pieChartViewHoverLabel;
}

- (void)initWithFrame:(CGRect)aFrame
{
    if (self = [super initWithFrame:aFrame])
    {
        
        /*

            LPChartView
        
        */
        var chartViewLabel = [CPTextField labelWithTitle:@"LPChartView"];
        [chartViewLabel setFrameOrigin:CGPointMake(50, 70)];
        [self addSubview:chartViewLabel];
        
        values = [100,50,20,40,50,40,20,60,40,84,27,28];
        
        chartView = [[LPChartView alloc] initWithFrame:CGRectMake(50,100,600,150)];
        [chartView setDataSource:self];
        [chartView setDelegate:self];
        [chartView setDrawView:[[LPChartDrawView alloc] init]];
        //[chartView setDisplayLabels:NO];
        //[chartView setDisplayGrid:NO];
        //[chartView reloadData];
        [self addSubview:chartView];
        
        chartViewHoverLabel = [CPTextField textFieldWithStringValue:@"" placeholder:@"ChartView Event" width:300];
        [chartViewHoverLabel setFrameOrigin:CGPointMake(50,270)]
        [self addSubview:chartViewHoverLabel];
        
        
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
        
        /*

            LPPieChartView

        */
        var pieChartLabel = [CPTextField labelWithTitle:@"LPPieChartView"];
        [pieChartLabel setFrameOrigin:CGPointMake(50, 340)];
        [self addSubview:pieChartLabel];

        pieChartValues = [50.0, 45.0, 30.0, 22.0, 18.0, 14.0, 12.0];

        var pieChart = [[LPPieChartView alloc] initWithFrame:CGRectMake(50,400,200,200)];
        [[pieChart drawView] setTheme:LPAristo];
        [pieChart setDataSource:self];
        [pieChart setDelegate:self];
        [self addSubview:pieChart];
        
        pieChartViewHoverLabel = [CPTextField textFieldWithStringValue:@"" placeholder:@"PieChartView Event" width:300];
        [pieChartViewHoverLabel setFrameOrigin:CGPointMake(280,400)]
        [self addSubview:pieChartViewHoverLabel];
    }
    return self;
}

/*
    LPChartView DataSource methods:
*/

- (void)numberOfSetsInChart:(LPChartView)aChartView
{
    return 1;
}

- (void)chart:(LPChartView)aChartView numberOfValuesInSet:(int)aSet
{
    return values.length;
}

- (int)chart:(LPChartView)aChartView valueForIndex:(int)anIndex set:(int)aSet
{
    return (values.length > 0) ? values[anIndex] : 0;
}

- (CPString)chart:(LPChartView)aChartView labelValueForIndex:(int)anIndex
{
    return @"" + values[anIndex];
}

/*
    LPChartView Delegate methods
*/

- (void)chart:(LPChartView)aChart didMouseOverItemAtIndex:(int)anIndex
{
    var stringValue = (anIndex >= 0) ? @"Hovering over #" + anIndex + ", value: " + values[anIndex] : @"";
    
    [chartViewHoverLabel setStringValue:stringValue];
}

/*
    LPPieChartView DataSource methods:
*/

- (int)numberOfItemsInPieChartView:(LPPieChartView)aPieChartView
{
    return pieChartValues.length;
}

- (int)pieChartView:(LPPieChartView)aPieChartView floatValueForIndex:(int)anIndex
{
    return pieChartValues[anIndex];
}

/*
    LPChartView Delegate methods
*/

- (void)pieChartView:(LPPieChartView)aPieChartView mouseMovedOverIndex:(int)anIndex
{
    var stringValue = (anIndex >= 0) ? @"Hovering over #" + anIndex + ", value: " + pieChartValues[anIndex] : @"";

    [pieChartViewHoverLabel setStringValue:stringValue]
}

@end