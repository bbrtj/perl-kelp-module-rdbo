use File::Temp 'tempfile';

my ( $fh, $tempfile ) = tempfile();

{
    modules      => [qw/RDBO/],
    modules_init => {
        RDBO => {
            prefix       => 'MyApp::DB',
            default_type => 'main',
            source       => [
                {
                    type     => 'main',
                    driver   => 'SQLite',
                    database => $tempfile
                }
            ],
        },
    }
};
