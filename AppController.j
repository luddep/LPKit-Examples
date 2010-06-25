/*
 * AppController.j
 * LPKit
 *
 * Created by Ludwig Pettersson on October 12, 2009.
 */
 
@import <Foundation/CPObject.j>
@import <LPKit/LPKit.j>
@import "ControlsAndViewsView.j"
@import "ChartsView.j"

LPAristo = nil;

var repositoryURL = @"http://github.com/luddep/LPKit";

@implementation AppController : CPObject
{
    CPWindow theWindow;
    CPSegmentedControl navigation;
    
    LPSlideView slideView;
    
    id controlsAndViewsView;
    id chartsView;
}
 
- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask];
    [theWindow setAcceptsMouseMovedEvents:YES];
    [theWindow orderFront:self];
    
    var lpAristoTheme = [[CPThemeBlend alloc] initWithContentsOfURL:@"LPAristo/Build/Debug/LPAristo.blend"]; 
    [lpAristoTheme loadWithDelegate:self];
}

- (void)blendDidFinishLoading:(CPBundle)aBundle
{
    LPAristo = [CPTheme themeNamed:@"LPAristo"];
    //[CPTheme setDefaultTheme:[CPTheme themeNamed:@"LPAristo"]];
    
    var contentView = [theWindow contentView],
        bounds = [contentView bounds];
 
    [contentView setBackgroundColor:[CPColor colorWithHexString:@"eee"]];

    var title = [CPTextField labelWithTitle:@"LPKit Examples"];
    [title setFont:[CPFont systemFontOfSize:25]];
    [title setTextColor:[CPColor colorWithWhite:0 alpha:0.8]];
    [title setTextShadowColor:[CPColor whiteColor]];
    [title setTextShadowOffset:CGSizeMake(1,1)];
    [title setFrameOrigin:CGPointMake(100,30)];
    [title sizeToFit];
    [contentView addSubview:title];
    
    var description = [CPTextField labelWithTitle:@"A demo application showing (most) of LPKit."];
    [description setFont:[CPFont boldSystemFontOfSize:12]];
    [description setTextColor:[CPColor colorWithWhite:0 alpha:0.4]];
    [description setTextShadowColor:[CPColor whiteColor]];
    [description setTextShadowOffset:CGSizeMake(1,1)];
    [description setFrameOrigin:CGPointMake(100, CGRectGetMaxY([title frame]))];
    [description sizeToFit];
    [contentView addSubview:description];
    
    var githubLink = [LPAnchorButton buttonWithTitle:repositoryURL];
    [githubLink setTextColor:[CPColor colorWithWhite:0 alpha:0.3]];
    [githubLink setTextHoverColor:[CPColor colorWithWhite:0 alpha:0.6]];
    [githubLink setFrameOrigin:CGPointMake(100, CGRectGetMaxY([description frame]) + 2)];
    [githubLink openURLOnClick:[CPURL URLWithString:repositoryURL]]
    [contentView addSubview:githubLink];

    var box = [[CPBox alloc] initWithFrame:CGRectMake(100, 120, CGRectGetWidth(bounds) - 200, CGRectGetHeight(bounds) - 240)];
    [box setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [[box contentView] setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [box setCornerRadius:2.0];
    [box setBorderType:CPLineBorder];
    [box setBorderColor:[CPColor colorWithWhite:0 alpha:0.2]];
    [box setBackgroundColor:[CPColor whiteColor]];
    [contentView addSubview:box];

    // Navigation controller
    navigation = [[CPSegmentedControl alloc] initWithFrame:CGRectMake(0,0, 0, 28)];
    [navigation setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
    [navigation setSegmentCount:2];
    
    [navigation setWidth:120.0 forSegment:0];
    [navigation setLabel:@"Views & Controls" forSegment:0];
    [navigation setTag:@"views" forSegment:0];
    
    [navigation setWidth:60.0 forSegment:1];
    [navigation setLabel:@"Charts" forSegment:1];
    [navigation setTag:@"charts" forSegment:1];
    
    [navigation setTarget:self];
    [navigation setAction:@selector(didClickNavigation:)];
    [navigation setCenter:CGPointMake(CGRectGetMidX(bounds), CGRectGetMinY([box frame]))];
    [contentView addSubview:navigation];
    
    var boxBounds = [[box contentView] bounds];
    
    slideView = [[LPSlideView alloc] initWithFrame:boxBounds];
    [slideView setAnimationCurve:CPAnimationEaseInOut];
    [slideView setAnimationDuration:0.5];
    [slideView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [[box contentView] addSubview:slideView];
    
    controlsAndViewsView = [[ControlsAndViewsView alloc] initWithFrame:boxBounds];
    [slideView addSubview:controlsAndViewsView];

    chartsView = [[ChartsView alloc] initWithFrame:boxBounds];
    [slideView addSubview:chartsView];

    // Register for location changes
    [[LPLocationController sharedLocationController] addObserver:self selector:@selector(locationDidChange:)];
} 

- (void)didClickNavigation:(id)sender
{
    var tag = [sender selectedTag];
    
    // Update location
    [[LPLocationController sharedLocationController] setLocation:tag];
    
    [self selectedNavigationItemWithTag:tag];
}

- (void)locationDidChange:(CPString)aLocation
{
    [self selectedNavigationItemWithTag:aLocation];
}

- (void)selectedNavigationItemWithTag:(CPString)aTag
{
    // Default tag, aTag might be empty
    if (!aTag)
        aTag = @"views";
    
    [navigation selectSegmentWithTag:aTag];
    
    switch (aTag)
    {
        case @"views":  [slideView slideToView:controlsAndViewsView];
                        break;
                        
        case @"charts": [slideView slideToView:chartsView];
                        break;
    }
}
 
@end