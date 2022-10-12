namespace :bundle do
  desc "Check dependencies for known vulnerabilites"
  task audit: [:environment] do
    sh "bundle exec bundle-audit check -u"
  end

  desc "Check dependencies for known memory leaks"
  task leak: [:environment] do
    sh "bundle exec bundle-leak check -u"
  end
end

desc "Scans application for vulnerabilities"
task brakeman: [:environment] do
  sh "bundle exec brakeman -q --no-pager"
end

desc "Run static analysis code quality report"
task rubycritic: [:environment] do
  sh "bundle exec rubycritic --minimum-score 90"
end

namespace :test do
  desc "Runs rubocop, bundle:audit, bundle:leak, brakeman, rubycritic, and test:all"
  task ci: %i[rubocop bundle:audit bundle:leak brakeman test:all rubycritic] do
  end
end
