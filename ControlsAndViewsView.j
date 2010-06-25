/*
 * ControlsAndViewsView.j
 * LPKit
 *
 * Created by Ludwig Pettersson on January 13, 2010.
 */


@implementation ControlsAndViewsView : CPView
{
    LPSlideView slideView;
    CPTextField calendarSelectionLabel;
    CPTextField switchStatusLabel;
}


- (void)initWithFrame:(CGRect)aFrame
{
    if (self = [super initWithFrame:aFrame])
    {
        /*

            LPSlideView

        */

        var slideViewLabel = [CPTextField labelWithTitle:@"LPSlideView"];
        [slideViewLabel setFrameOrigin:CGPointMake(100, 70)];
        [self addSubview:slideViewLabel];

        slideView = [[LPSlideView alloc] initWithFrame:CGRectMake(100,100,200,100)];
        //[slideView setSlideDirection:LPSlideViewVerticalDirection];
        [self addSubview:slideView];

        var greenView = [[CPView alloc] initWithFrame:[slideView bounds]];
        [greenView setBackgroundColor:[CPColor colorWithHexString:@"c2e890"]];
        [slideView addSubview:greenView];

        var blueView = [[CPView alloc] initWithFrame:[slideView bounds]];
        [blueView setBackgroundColor:[CPColor colorWithHexString:@"90c8e8"]];
        [slideView addSubview:blueView];

        var redView = [[CPView alloc] initWithFrame:[slideView bounds]];
        [redView setBackgroundColor:[CPColor colorWithHexString:@"e89090"]];
        [slideView addSubview:redView];

        var segmentedControl = [[CPSegmentedControl alloc] initWithFrame:CGRectMake(CGRectGetMinX([slideView frame]), CGRectGetMaxY([slideView frame]) + 5, 5, 24)];
        [segmentedControl setSegmentCount:3];
        [segmentedControl setLabel:@"First" forSegment:0];
        [segmentedControl setTag:0 forSegment:0];
        [segmentedControl setLabel:@"Second" forSegment:1];
        [segmentedControl setTag:1 forSegment:1];
        [segmentedControl setLabel:@"Third" forSegment:2];
        [segmentedControl setTag:2 forSegment:2];
        [segmentedControl setTarget:self];
        [segmentedControl setAction:@selector(didClickSegmented:)];
        [segmentedControl setSelectedSegment:0];

        [self addSubview:segmentedControl];

        /*

            LPCalendarView

        */

        var slideViewLabel = [CPTextField labelWithTitle:@"LPCalendarView"];
        [slideViewLabel setFrameOrigin:CGPointMake(400, 70)];
        [self addSubview:slideViewLabel];

        var calendarView = [[LPCalendarView alloc] initWithFrame:CGRectMake(400, 100, 189, 166)];
        [calendarView setTheme:LPAristo];
        [calendarView setMonth:[CPDate date]];
        [calendarView setDelegate:self];
        [self addSubview:calendarView];

        calendarSelectionLabel = [CPTextField textFieldWithStringValue:@"" placeholder:@"selection" width:300];
        [calendarSelectionLabel setFrameOrigin:CGPointMake(400,270)]
        [self addSubview:calendarSelectionLabel];


        /*

            LPSwitch

        */

        var switchLabel = [CPTextField labelWithTitle:@"LPSwitch"];
        [switchLabel setFrameOrigin:CGPointMake(100, 340)];
        [self addSubview:switchLabel];

        var aSwitch = [[LPSwitch alloc] initWithFrame:CGRectMake(100,380,77,24)];
        [aSwitch setTheme:LPAristo];
        [aSwitch setTarget:self];
        [aSwitch setAction:@selector(switchDidChange:)];
        [self addSubview:aSwitch];

        switchStatusLabel = [CPTextField labelWithTitle:@"status: off"];
        [switchStatusLabel setTextColor:[CPColor colorWithWhite:0 alpha:0.5]];
        [switchStatusLabel setFrameOrigin:CGPointMake(100,410)];
        [self addSubview:switchStatusLabel];
        
    }
    return self;
}


- (void)didClickSegmented:(id)sender
{
    var index = [sender tagForSegment:[sender selectedSegment]];

    [slideView slideToView:[[slideView subviews] objectAtIndex:index]];
}

- (void)calendarView:(LPCalendarView)aCalendarView didMakeSelection:(CPDate)aStartDate end:(CPDate)anEndDate
{
    [calendarSelectionLabel setStringValue:[CPString stringWithFormat:@"Selected: %s", aStartDate.toUTCString()]];
}

- (void)switchDidChange:(id)sender
{
    [switchStatusLabel setStringValue:@"status: " + (([sender isOn]) ? @"on" : @"off")];
    [switchStatusLabel sizeToFit];
}

@end