<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <dependency mavenUrl="com.android.support:design:${buildApi}.+" />

<#if minApiLevel lt 21>
    <dependency mavenUrl="com.android.support:support-vector-drawable:${buildApi}.+" />

    <merge from="root/build.gradle"
             to="${escapeXmlAttribute(projectOut)}/build.gradle" />
</#if>

    <#include "../common/recipe_manifest.xml.ftl" />
    
    <!-- Add layouts. -->
    <!-- Template Activity -->
    <instantiate from="root/src/app_package/TemplateActivity.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.${ktOrJavaExt}" />
    <instantiate from="root/res/layout/activity_template.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />

    <!-- Template Fragment -->
    <instantiate from="root/src/app_package/TemplateFragment.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${fragmentClass}.${ktOrJavaExt}" />
    <instantiate from="root/res/layout/fragment_template.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />

    <!-- Fragments -->
    <!-- Dashboard Fragment. -->
    <instantiate from="root/src/app_package/DashboardFragment.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/DashboardFragment.${ktOrJavaExt}" />
    <!-- Home Fragment. -->
    <instantiate from="root/src/app_package/HomeFragment.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/HomeFragment.${ktOrJavaExt}" />
    <!-- Notification Fragment. -->
    <instantiate from="root/src/app_package/NotificationFragment.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/NotificationFragment.${ktOrJavaExt}" />
    <!-- NoScrollingViewPager -->
    <instantiate from="root/src/app_package/NoScrollingViewPager.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/NoScrollingViewPager.${ktOrJavaExt}" />
    <!-- ViewPager Adapter Fragment. -->
    <instantiate from="root/src/app_package/TemplatePagerAdapter.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${pagerAdapterClass}.${ktOrJavaExt}" />


    <!-- res -->
    <!-- Add drawables. -->
    <copy from="root/res/drawable"
            to="${escapeXmlAttribute(resOut)}/drawable" />
    <!-- Append strings. -->
    <merge from="root/res/values/strings.xml"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
    <!-- Append colors. -->
    <merge from="root/res/values/colors.xml"
             to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
    <!-- Append styles. -->
    <merge from="root/res/values/styles.xml"
             to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
    <!-- Add menu. -->
    <copy from="root/res/menu/navigation.xml"
            to="${escapeXmlAttribute(resOut)}/menu/navigation.xml" />

    <open file="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
</recipe>
