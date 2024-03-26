
[Karbiner-elements 설정 install](https://genesy.github.io/karabiner-complex-rules-generator/#eyJ0aXRsZSI6InNldW5ndWtsZWUncyBrYXJhYmluZXIgc2V0dGluZ3MiLCJydWxlcyI6W3siZGVzY3JpcHRpb24iOiJjYXBzX2xvY2sgdG8gbGVmdF9jb250cm9sIiwibWFuaXB1bGF0b3JzIjpbeyJmcm9tIjp7ImtleV9jb2RlIjoiY2Fwc19sb2NrIiwibW9kaWZpZXJzIjp7Im9wdGlvbmFsIjpbImFueSJdfX0sInRvIjpbeyJrZXlfY29kZSI6ImxlZnRfY29udHJvbCJ9XSwidHlwZSI6ImJhc2ljIn1dfV19)

```
{
  "title": "seunguklee's karabiner settings",
  "rules": [
    {
      "description": "caps_lock to left_control",
      "manipulators": [
        {
          "from": {
            "key_code": "caps_lock",
            "modifiers": {
              "optional": [
                "any"
              ]
            }
          },
          "to": [
            {
              "key_code": "left_control"
            }
          ],
          "type": "basic"
        }
      ]
    }
  ]
}
```