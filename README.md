stackstorm Cookbook
===================
Install and configure stackstorm

Requirements
------------

Tested on Ubuntu 14.04 and Centos 7.0

Attributes
----------
#### stackstorm::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['stackstorm']['package_url']</tt></td>
    <td>String</td>
    <td>The base package url</td>
    <td><tt>https://ops.stackstorm.net/releases/st2</tt></td>
  </tr>
  <tr>
    <td><tt>['stackstorm']['version']</tt></td>
    <td>String</td>
    <td>The major version</td>
    <td><tt>0.7</tt></td>
  </tr>
  <tr>
    <td><tt>['stackstorm']['patch_version']</tt></td>
    <td>String</td>
    <td>The patch version</td>
    <td><tt>16</tt></td>
  </tr>
</table>

Usage
-----
#### stackstorm::default
Just include `stackstorm` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[stackstorm]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License & Authors
-----------------
- Author: Jim Rosser (jarosser06@gmail.com)

```text
copyright (C) 2015 Jim Rosser

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the “Software”), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
```
