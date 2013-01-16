# encoding: utf-8
require 'spec_helper'

describe "Static Pages" do

    describe "HomePage" do
        before { visit '/home' }
        subject { page }

        it "should have the content 'We Meet In Toulouse'" do
            should have_content('We Meet In Toulouse')
        end

        it "should include google calendar" do
            should have_selector("iframe", :src => "https://www.google.com/calendar/embed?src=titkqiqe5bsg7ij1hh757f2hvg%40group.calendar.google.com&ctz=Europe/Paris")
        end

        it "should have the right title" do
            should have_selector('title', :text => "We Meet In Toulouse | Home")
        end

        it "should have link to ical" do
            should have_selector("a", :text => "iCal")
            should have_selector("a", :href => "http://www.google.com/calendar/ical/titkqiqe5bsg7ij1hh757f2hvg%40group.calendar.google.com/public/basic.ics")
        end

        it "should have link to xml" do
            should have_selector("a", :text => "Xml")
            should have_selector("a", :href => "http://www.google.com/calendar/ical/titkqiqe5bsg7ij1hh757f2hvg%40group.calendar.google.com/public/basic")
        end
    end

    describe "About" do
        before { visit '/about' }

        it "should have the content 'À propos'" do
            page.should have_content('À propos')
        end

        it "should have the right title" do
            page.should have_selector('title', :text => "We Meet In Toulouse | À propos")
        end
    end

end
