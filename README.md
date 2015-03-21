# Citable
This is an Angular Dart package that displays a bibliographic entry when the cursor is placed over the citation.

Citable works just like a tooltip. The important difference is that it's designed to simplify the effort of the page author in adding them. Once the package is installed, the addition of citations and bibliographic entries is a two step process all within the target html page. The formatting of the citation and the bibliographic entry can be completely customized through CSS changes.

## Example
You can add a citable to your page in two easy steps.

### Add the Citation

Create a citation by using the following tags:

```html
<citation bentry=1>your citation text</citation>
```

In your bibliography add a division with an id that corresponds to the citation: bex where x is the value specified in bentry. 

```html
<div id='be1'>
<p>your entry</p>
</div>
```

You can put anything you want in the division including other divisions and images. In the index.html file supplied, the footnote like entry is wrapped in a division with visibility set to hidden. This is optional. If you decide to make use of it, you should move the styling to your css.

## Customizing the CSS

To format bibliographic entries, add a the class bibliographic-entry to your CSS. The CSS supplied with this package is:

```html
.bibliographic-entry
{
    padding: 5px;
    padding-bottom: 0px;
    color: black;
    font-size: smaller;
    background-color: #FFF5E0;
    border-radius: 5px;
    width: 200px;
}
```

The CSS for the citation is part of the citation component. To change it, you must modify the cite-text class lib/component/citation.css file. The file currently contains the following:

```html
.cite-text
{
    border-bottom: 1px dashed #808080;
}
```
## Caveat
Citation CSS is inconsistently applied in Chrome and Chromium on OS X at this point. An issue has been opened. Is it known to work in Sarfari and Firefow on OS X.

This project is in alpha. It's being put up now to aid in identifying the browser issue.
