/*
 * ThemeDescriptors.j
 * LPAristo
 *
 * Created by You on November 7, 2009.
 * Copyright 2009, Your Company All rights reserved.
 */

@import <LPKit/LPKit.j>
@import <BlendKit/BKThemeDescriptor.j>

@implementation LPAristoThemeDescriptor : BKThemeDescriptor
{
}

+ (CPString)themeName
{
    return @"LPAristo";
}

+ (CPButton)themedSwitch
{
    var aSwitch = [[LPSwitch alloc] initWithFrame:CGRectMake(0,0,77,24)];
    
    var offBackgroundImage = [_CPCibCustomResource imageResourceWithName:@"switch-off-background.png" size:CGSizeMake(CGRectGetWidth([aSwitch bounds]), CGRectGetHeight([aSwitch bounds]))];
    [aSwitch setValue:[CPColor colorWithPatternImage:offBackgroundImage] forThemeAttribute:@"off-background-color"];
    
    var onBackgroundImage = [_CPCibCustomResource imageResourceWithName:@"switch-on-background.png" size:CGSizeMake(CGRectGetWidth([aSwitch bounds]), CGRectGetHeight([aSwitch bounds]))];
    [aSwitch setValue:[CPColor colorWithPatternImage:onBackgroundImage] forThemeAttribute:@"on-background-color"];
    
    var knobBackgroundImage = [_CPCibCustomResource imageResourceWithName:@"switch-knob.png" size:CGSizeMake(CGRectGetWidth([aSwitch bounds]), CGRectGetHeight([aSwitch bounds]))],
        highlightedKnobBackgroundImage = [_CPCibCustomResource imageResourceWithName:@"switch-knob-highlighted.png" size:CGSizeMake(CGRectGetWidth([aSwitch bounds]), CGRectGetHeight([aSwitch bounds]))];
    [aSwitch setValue:[CPColor colorWithPatternImage:knobBackgroundImage] forThemeAttribute:@"knob-background-color" inState:CPThemeStateNormal];
    [aSwitch setValue:[CPColor colorWithPatternImage:highlightedKnobBackgroundImage] forThemeAttribute:@"knob-background-color" inState:CPThemeStateNormal | CPThemeStateHighlighted];
    [aSwitch setValue:CGSizeMake(30,24) forThemeAttribute:@"knob-size"];
    
    // Labels
    [aSwitch setValue:CGSizeMake(12,4) forThemeAttribute:@"label-offset"];
    
    // Off label
    [aSwitch setValue:[CPFont boldSystemFontOfSize:11] forThemeAttribute:@"off-label-font"];
    [aSwitch setValue:[CPColor colorWithWhite:0 alpha:0.7] forThemeAttribute:@"off-label-text-color"];
    [aSwitch setValue:[CPColor colorWithWhite:1 alpha:0.8] forThemeAttribute:@"off-label-text-shadow-color"];
    [aSwitch setValue:CGSizeMake(0,1) forThemeAttribute:@"off-label-text-shadow-offset"];
    
    // On label
    [aSwitch setValue:[CPFont boldSystemFontOfSize:11] forThemeAttribute:@"on-label-font"];
    [aSwitch setValue:[CPColor colorWithWhite:0 alpha:0.7] forThemeAttribute:@"on-label-text-color"];
    [aSwitch setValue:[CPColor colorWithWhite:1 alpha:0.8] forThemeAttribute:@"on-label-text-shadow-color"];
    [aSwitch setValue:CGSizeMake(0,1) forThemeAttribute:@"on-label-text-shadow-offset"];
    
    return aSwitch;
}

+ (LPCalendarView)themedCalendarView
{
    var calendarView = [[LPCalendarView alloc] initWithFrame:CGRectMake(0,0,195,172)];
    [calendarView setMonth:[CPDate date]];

    [calendarView setValue:[CPColor colorWithWhite:0.8 alpha:1] forThemeAttribute:@"grid-color"]

    /* Calendar View
    */
    var backgroundImage = [_CPCibCustomResource imageResourceWithName:@"LPCalendarView/background.png" size:CGSizeMake(1.0, 21.0)];
    [calendarView setValue:[CPColor colorWithPatternImage:backgroundImage] forThemeAttribute:@"background-color"];

    /* Header View
    */
    
    var headerBackgroundImage = [_CPCibCustomResource imageResourceWithName:@"LPCalendarView/header-background.png" size:CGSizeMake(182.0, 40.0)];
    [calendarView setValue:[CPColor colorWithPatternImage:headerBackgroundImage] forThemeAttribute:@"header-background-color" inState:CPThemeStateNormal];
    
    [calendarView setValue:[CPFont boldSystemFontOfSize:11.0] forThemeAttribute:@"header-font" inState:CPThemeStateNormal];
    [calendarView setValue:[CPColor colorWithHexString:@"333"] forThemeAttribute:@"header-text-color" inState:CPThemeStateNormal];
    [calendarView setValue:[CPColor whiteColor] forThemeAttribute:@"header-text-shadow-color" inState:CPThemeStateNormal];
    [calendarView setValue:CGSizeMake(1.0, 1.0) forThemeAttribute:@"header-text-shadow-offset" inState:CPThemeStateNormal];
    [calendarView setValue:CPCenterTextAlignment forThemeAttribute:@"header-alignment" inState:CPThemeStateNormal];

    /* Day Tile View
    */
    // Normal
    var bezelColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
                [
                    [_CPCibCustomResource imageResourceWithName:@"LPCalendarView/default-tile-bezel-left.png" size:CGSizeMake(1.0, 21.0)],
                    [_CPCibCustomResource imageResourceWithName:@"LPCalendarView/default-tile-bezel-center.png" size:CGSizeMake(21.0, 21.0)],
                    nil
                ]
            isVertical:NO]];

    [calendarView setValue:[CPFont boldSystemFontOfSize:11.0] forThemeAttribute:@"tile-font" inState:CPThemeStateNormal];
    [calendarView setValue:[CPColor colorWithHexString:@"333"] forThemeAttribute:@"tile-text-color" inState:CPThemeStateNormal];
    [calendarView setValue:[CPColor colorWithWhite:1 alpha:0.8] forThemeAttribute:@"tile-text-shadow-color" inState:CPThemeStateNormal];
    [calendarView setValue:CGSizeMake(1.0, 1.0) forThemeAttribute:@"tile-text-shadow-offset" inState:CPThemeStateNormal];

    [calendarView setValue:bezelColor forThemeAttribute:@"tile-bezel-color" inState:CPThemeStateNormal];

    // Highlighted
    var highlightedBezelColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
                [
                    nil,
                    [_CPCibCustomResource imageResourceWithName:@"LPCalendarView/highlighted-tile-bezel.png" size:CGSizeMake(21.0, 21.0)],
                    nil
                ]
            isVertical:NO]];
    [calendarView setValue:highlightedBezelColor forThemeAttribute:@"tile-bezel-color" inState:CPThemeStateHighlighted];        
    [calendarView setValue:[CPColor colorWithHexString:@"555"] forThemeAttribute:@"tile-text-color" inState:CPThemeStateHighlighted];

    // Selected
    var selectedBezelColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
                [
                    nil,
                    [_CPCibCustomResource imageResourceWithName:@"LPCalendarView/selected-tile-bezel.png" size:CGSizeMake(15.0, 15.0)],
                    nil
                ]
            isVertical:NO]];

    [calendarView setValue:[CPColor colorWithHexString:@"fff"] forThemeAttribute:@"tile-text-color" inState:CPThemeStateSelected];
    [calendarView setValue:[CPColor colorWithWhite:0 alpha:0.4] forThemeAttribute:@"tile-text-shadow-color" inState:CPThemeStateSelected];
    [calendarView setValue:selectedBezelColor forThemeAttribute:@"tile-bezel-color" inState:CPThemeStateSelected];

    // Selected & Highlighted
    var selectedHighlightedBezelColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
                [
                    nil,
                    [_CPCibCustomResource imageResourceWithName:@"LPCalendarView/selected-highlighted-tile-bezel.png" size:CGSizeMake(15.0, 15.0)],
                    nil
                ]
            isVertical:NO]];
    [calendarView setValue:selectedHighlightedBezelColor forThemeAttribute:@"tile-bezel-color" inState:CPThemeStateHighlighted | CPThemeStateSelected];

    // Disabled
    [calendarView setValue:[CPColor colorWithWhite:0 alpha:0.3] forThemeAttribute:@"tile-text-color" inState:CPThemeStateDisabled];

    // Disabled & Selected (if that makes any sense.)
    var disabledSelectedBezelColor = [CPColor colorWithPatternImage:[[CPThreePartImage alloc] initWithImageSlices:
                [
                    nil,
                    [_CPCibCustomResource imageResourceWithName:@"LPCalendarView/selected-disabled-tile-bezel.png" size:CGSizeMake(21.0, 21.0)],
                    nil
                ]
            isVertical:NO]];
    [calendarView setValue:disabledSelectedBezelColor forThemeAttribute:@"tile-bezel-color" inState:CPThemeStateSelected | CPThemeStateDisabled];
    [calendarView setValue:[CPColor colorWithWhite:0 alpha:0.4] forThemeAttribute:@"tile-text-color" inState:CPThemeStateSelected | CPThemeStateDisabled];
    [calendarView setValue:[CPColor clearColor] forThemeAttribute:@"tile-text-shadow-color" inState:CPThemeStateSelected | CPThemeStateDisabled];

    return calendarView;
}

@end
