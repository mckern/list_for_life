# List For Life
## A library to easily retrieve and consume word lists

## Usage

```ruby
>> words = ListForLife.new(url: "lyrics", path: Dir.pwd)
=> ["drive", "a", "g.t.o", "wear", "a", "uniform", "all", "on", "a", "government", "loan", "i'm", "worth", "a", "million", "in", "prizes"]
>> words.case_sensitive = true
=> true
>> words
=> ["Drive", "a", "G.T.O", "Wear", "a", "uniform", "All", "on", "a", "government", "loan", "I'm", "worth", "a", "million", "in", "prizes"]
>>
```

### Support & contribution?

In the spirit of Jordan Sissel (a hero to admins and operations people everywhere), if List For Life is not helping you consume random word lists, then there is a bug in List For Life. Please open an issue or submit a pull request if something doesn't work.

## License

List For Life is licensed under the MIT License.

## Maintainer

Ryan McKern &lt;ryan@orangefort.com&gt;
