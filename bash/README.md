CommandAllThings - Bash
================

### What is this project?

Check out the parent [../README](../README.md)

### Install

This install is ugly - if anyone has a better/smoother way to do it, I'd love to hear...

1. Run the install above

```bash
curl https://raw.githubusercontent.com/staxmanade/CommandAllThings/master/bash/commandAllThings.sh > ~/commandAllThings.sh \
    && chmod +x ~/commandAllThings.sh \
    && curl https://raw.githubusercontent.com/staxmanade/CommandAllThings/master/bash/sampleProfile.sh > ~/commandAllThingsProfile.sh \
    && chmod +x ~/commandAllThingsProfile.sh && \
    echo "**********\nCopied 'commandAllThings.sh' and 'commandAllThingsProfile.sh' to '~\'\n\n*** NEXT STEP ***\n\n    Place this in your bash or zsh profile:\n\n   . ~/commandAllThingsProfile.sh\n"
```

2. Update your `.zshrc` or `.profile` profile to load the aliases EX: `. ~/commandAllThingsProfile.sh`

### But it doesn't have my tool?

What tool do you need added? Take a look at the [commandAllThings.sh](commandAllThings.sh) and see how you could extend it to support another tool. It's simple... Or open an issue and request an addition.
