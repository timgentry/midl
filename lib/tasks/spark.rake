desc 'Spark'
task :spark do
  require 'erb'

  hash = {
    views: [
      { name: 'people', source: 'resources/people.json' }
    ],
    sql: 'SELECT * FROM people'
  }

  cmd = "spark-submit spark_submitter.py \"#{ERB::Util.url_encode(hash.to_json)}\""

  Open3.popen3(cmd) do |_stdin, stdout, stderr, wait_thr|
    # pid = wait_thr.pid # pid of the started process.
    puts stdout.read

    exit_status = wait_thr.value
    next if exit_status.exited?

    raise stderr.read
  end
end
