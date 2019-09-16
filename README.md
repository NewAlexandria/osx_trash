# OSX Trash

Ruby class and CLI app for moving files to the OSX Trash

## Summary

The OSX Trash gem will take a filepath containing paths to files that should be moved to the OSX trash.  The list can be a little noisy, with things that will go away with `strip`. When instantiatin the class, you can pass a hash of file: with the pathname, or paths: with an array. }

This gem relies on Applescript (`osax`), which all Apple computers should have.

## Usage

```
OSX.trash file:path_to_file_list
```

When running locally, `send_to_trash` may move files that are in a watched folder, such as by Dropbox or Google Filestream.  These programs may raise a Finder dialog to confirm moving them.  You will have to click "OK" for each one.  This may cause problems on remote / headless systems.  Please file an issue with bug report, or a PR.  Thanks.


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/NewAlexandria/osx_trash. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OsxTrash project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/NewAlexandria/osx_trash/blob/master/CODE_OF_CONDUCT.md).
