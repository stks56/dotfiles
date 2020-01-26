"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const command_1 = require("./command");
class IndexCommand extends command_1.Command {
    constructor(index, ctx) {
        super(IndexCommand.CommandName, ctx, command_1.CommandType.INTERNAL);
        this.index = index;
    }
    perform(uri) {
        return __awaiter(this, void 0, void 0, function* () {
            let doc = vscode.workspace.textDocuments.find((d) => d.uri.toString() === uri.toString());
            if (!doc) {
                yield vscode.window.showErrorMessage(`No open document with uri ${uri.toString()} found`);
                return false;
            }
            let [file, group] = this.index.indexDocument(doc);
            return !!file && !!group;
        });
    }
}
IndexCommand.CommandName = "index-document";
exports.IndexCommand = IndexCommand;

//# sourceMappingURL=index.js.map
