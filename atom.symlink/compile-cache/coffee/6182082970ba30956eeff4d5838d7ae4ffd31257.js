(function() {
  var ERB_BLOCKS, ERB_CLOSER_REGEX, ERB_OPENER_REGEX, ERB_REGEX, Range;

  Range = require('atom').Range;

  ERB_BLOCKS = [['<%=', '%>'], ['<%', '%>'], ['<%#', '%>']];

  ERB_REGEX = '<%(=?|-?|#?)\s{2}(-?)%>';

  ERB_OPENER_REGEX = '<%[\\=\\#]?';

  ERB_CLOSER_REGEX = "%>";

  module.exports = {
    activate: function() {
      return atom.workspaceView.command("rails-snippets:toggleErb", (function(_this) {
        return function() {
          return _this.toggleErb();
        };
      })(this));
    },
    toggleErb: function() {
      var delegate, editor, hasTextSelected, selectedText, selection, _i, _len, _ref, _results;
      editor = atom.workspace.activePaneItem;
      _ref = editor.getSelections();
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i += 1) {
        selection = _ref[_i];
        hasTextSelected = !selection.isEmpty();
        selectedText = selection.getText();
        delegate = this;
        _results.push(editor.transact(function() {
          var closer, currentCursor, opener, textToRestoreRange, _ref1;
          selection.deleteSelectedText();
          currentCursor = selection.cursor;
          _ref1 = delegate.findSorroundingBlocks(editor, currentCursor), opener = _ref1[0], closer = _ref1[1];
          if ((opener != null) && (closer != null)) {
            delegate.replaceErbBlock(editor, opener, closer, currentCursor);
          } else {
            delegate.insertErbBlock(editor, currentCursor);
          }
          if (hasTextSelected) {
            textToRestoreRange = editor.getBuffer().insert(currentCursor.getBufferPosition(), selectedText);
            return selection.setBufferRange(textToRestoreRange);
          }
        }));
      }
      return _results;
    },
    findSorroundingBlocks: function(editor, currentCursor) {
      var closer, containingLine, foundClosers, foundOpeners, leftRange, opener, rightRange;
      opener = closer = null;
      containingLine = currentCursor.getCurrentLineBufferRange();
      leftRange = new Range(containingLine.start, currentCursor.getBufferPosition());
      rightRange = new Range(currentCursor.getBufferPosition(), containingLine.end);
      foundOpeners = [];
      editor.getBuffer().scanInRange(new RegExp(ERB_OPENER_REGEX, 'g'), leftRange, function(result) {
        return foundOpeners.push(result.range);
      });
      if (foundOpeners) {
        opener = foundOpeners[foundOpeners.length - 1];
      }
      foundClosers = [];
      editor.getBuffer().scanInRange(new RegExp(ERB_CLOSER_REGEX, 'g'), rightRange, function(result) {
        return foundClosers.push(result.range);
      });
      if (foundClosers) {
        closer = foundClosers[0];
      }
      return [opener, closer];
    },
    insertErbBlock: function(editor, currentCursor) {
      var closingBlock, defaultBlock, desiredPosition, openingTag;
      defaultBlock = ERB_BLOCKS[0];
      desiredPosition = null;
      openingTag = editor.getBuffer().insert(currentCursor.getBufferPosition(), defaultBlock[0] + ' ');
      desiredPosition = currentCursor.getBufferPosition();
      closingBlock = editor.getBuffer().insert(currentCursor.getBufferPosition(), ' ' + defaultBlock[1]);
      return currentCursor.setBufferPosition(desiredPosition);
    },
    replaceErbBlock: function(editor, opener, closer, currentCursor) {
      var closingBracket, nextBlock, openingBracket;
      openingBracket = editor.getBuffer().getTextInRange(opener);
      closingBracket = editor.getBuffer().getTextInRange(closer);
      nextBlock = this.getNextErbBlock(editor, openingBracket, closingBracket);
      editor.getBuffer().setTextInRange(closer, nextBlock[1]);
      return editor.getBuffer().setTextInRange(opener, nextBlock[0]);
    },
    getNextErbBlock: function(editor, openingBracket, closingBracket) {
      var block, i, _i, _len;
      for (i = _i = 0, _len = ERB_BLOCKS.length; _i < _len; i = ++_i) {
        block = ERB_BLOCKS[i];
        if (JSON.stringify([openingBracket, closingBracket]) === JSON.stringify(block)) {
          if ((i + 1) >= ERB_BLOCKS.length) {
            return ERB_BLOCKS[0];
          } else {
            return ERB_BLOCKS[i + 1];
          }
        }
      }
      return ERB_BLOCKS[0];
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiIgogIF0sCiAgIm5hbWVzIjogW10sCiAgIm1hcHBpbmdzIjogIkFBQ0E7QUFBQSxNQUFBLGdFQUFBOztBQUFBLEVBQUMsUUFBUyxPQUFBLENBQVEsTUFBUixFQUFULEtBQUQsQ0FBQTs7QUFBQSxFQUdBLFVBQUEsR0FBYSxDQUFDLENBQUMsS0FBRCxFQUFRLElBQVIsQ0FBRCxFQUFnQixDQUFDLElBQUQsRUFBTyxJQUFQLENBQWhCLEVBQThCLENBQUMsS0FBRCxFQUFRLElBQVIsQ0FBOUIsQ0FIYixDQUFBOztBQUFBLEVBSUEsU0FBQSxHQUFZLHlCQUpaLENBQUE7O0FBQUEsRUFNQSxnQkFBQSxHQUFtQixhQU5uQixDQUFBOztBQUFBLEVBUUEsZ0JBQUEsR0FBbUIsSUFSbkIsQ0FBQTs7QUFBQSxFQVVBLE1BQU0sQ0FBQyxPQUFQLEdBQ0U7QUFBQSxJQUFBLFFBQUEsRUFBVSxTQUFBLEdBQUE7YUFDUixJQUFJLENBQUMsYUFBYSxDQUFDLE9BQW5CLENBQTJCLDBCQUEzQixFQUF1RCxDQUFBLFNBQUEsS0FBQSxHQUFBO2VBQUEsU0FBQSxHQUFBO2lCQUFHLEtBQUMsQ0FBQSxTQUFELENBQUEsRUFBSDtRQUFBLEVBQUE7TUFBQSxDQUFBLENBQUEsQ0FBQSxJQUFBLENBQXZELEVBRFE7SUFBQSxDQUFWO0FBQUEsSUFHQSxTQUFBLEVBQVcsU0FBQSxHQUFBO0FBQ1QsVUFBQSxvRkFBQTtBQUFBLE1BQUEsTUFBQSxHQUFTLElBQUksQ0FBQyxTQUFTLENBQUMsY0FBeEIsQ0FBQTtBQUNBO0FBQUE7V0FBQSw4Q0FBQTs2QkFBQTtBQUNFLFFBQUEsZUFBQSxHQUFrQixDQUFBLFNBQVUsQ0FBQyxPQUFWLENBQUEsQ0FBbkIsQ0FBQTtBQUFBLFFBQ0EsWUFBQSxHQUFlLFNBQVMsQ0FBQyxPQUFWLENBQUEsQ0FEZixDQUFBO0FBQUEsUUFFQSxRQUFBLEdBQVcsSUFGWCxDQUFBO0FBQUEs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
//# sourceURL=/Users/joseramonc/src/rails-snippets/lib/rails-snippets.coffee