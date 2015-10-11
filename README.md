# dogshoe
Ruby ORM backed by scraped websites

Say we are given the following HTML on anyotherwebpage.com

    <table class="some_class">
      <tr>
        <th>Some Thing</th><th>Some Thing Else</th>
      </tr>
      <tr>
        <td>first value</td><td>1000</td>
      </tr>
      <tr>
        <td>second value</td><td>2000</td>
      </tr>
    </table>

Let's stop being polite, and start modeling!

    things = DogShoe::Table.find(
      url: 'http://anyotherwebpage.com',
      css: '.some_class'
    )

    => [#<DogShoe::Table>, #<DogShoe::Table>]


    this.first.some_thing

    => 'first value'
