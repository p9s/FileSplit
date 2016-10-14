#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

my $out = {};

my @cols;
while ( my $row = <DATA> ) {
    if ( $. == 1 ) {
        @cols = split /\t/, $row;
        shift @cols;
        map { $out->{$_} = [] } @cols;
    }
    else {
        my @data = split /\t/, $row;
        my $symbl = shift @data;

        my $col_index = 0;
        foreach my $d (@data) {
            my $txt = sprintf( '"%s"="%s"', $symbl, $d );
            push @{ $out->{ $cols[$col_index] } }, $txt;
            $col_index++;
        }
    }
}

foreach my $key ( keys %$out ) {
    my $file = $key . '-trans.txt';

    open my $fh, '>', $file || die "$!";
    map { print $fh "$_\n" } @{ $out->{$key} };
    close $fh;
}


__DATA__
Constants	English	Japanese	Dutch	Thai
Bullet_Character	•	•	•	•
Downloading a lesson from LessonNote Pro				
CloudSessionsModalViewControllerLessons	Lessons	授業記録	Lessen	บทเรียน
CloudSessionsModalViewControllerFetchData	Fetching data	データの取得中	Invoeren data	Fetching data
CloudSessionsModalViewControllerFetchChartData	Fetching seating chart	座席表データの取得中	Invoeren van klasindeling	Fetching seating chart
CloudSessionsModalViewControllerFetchPhotoData	Fetching photo data	写真データの取得中	Invoeren van foto data	Fetching photo data
CloudSessionsModalViewControllerFetchList	Fetching lesson list	授業記録リストの取得中	Invoeren van les	Fetching lesson list
CloudSessionsModalViewControllerMissingChart	No seating chart found for specified lesson!	指定された授業記録の座席表が見つかりません!	Geen klasindeling gevonden voor deze les!	No seating chart found for specified lesson!
Seating charts (also called 'classrooms')				
ClassroomEditModalViewControllerCancel	Cancel	キャンセル	Annuleren	ยกเลิก
ClassroomEditModalViewControllerChart	Seating Chart	座席表	Klasindeling	ผังที่นั่ง
ClassroomEditModalViewControllerDelete	Delete	削除する	Verwijderen	ลบ
ClassroomEditModalViewControllerDeleteClassroom	Delete seating chart?	座席表を削除？	Verwijderen klasindeling?	ต้องการลบผังที่นั่งนี้หรือไม่
ClassroomEditModalViewControllerDeleteConfirmation	Are you sure?\nThis cannot be undone.	削除してよろしいですか？\nこの操作のやり直しはできません。	Weet je het zeker?\nDit kan niet ongedaan gemaakt worden.	Are you sure?\nThis cannot be undone.
ClassroomEditModalViewControllerDeleteConfirmationLNPro	Are you sure?\nThis cannot be undone.\n(Data uploaded to LessonNote Pro will not be affected.)	削除してよろしいですか？\nこの操作のやり直しはできません。\n(LessonNote Proにアップロードしたデータは削除されません)	Weet je het zeker?\nDit kan niet ongedaan gemaakt worden.\nData geüpload naar Lesson Note Pro wordt niet gewijzigd.	Are you sure?\nThis cannot be undone.\n(Data uploaded to LessonNote Pro will not be affected.)
